# https://birdeehub.github.io/nix-wrapper-modules/neovim.html#tips-and-tricks
inputs:
{
  config,
  wlib,
  lib,
  options,
  ...
}:
{
  options = {
    # Inform our lua of which top level specs are enabled
    settings.cats = lib.mkOption {
      readOnly = true;
      type = lib.types.attrsOf lib.types.bool;
      default = builtins.mapAttrs (_: v: v.enable) config.specs;
    };
    # build plugins from inputs set
    nvim-lib = {
      neovimPlugins = lib.mkOption {
        readOnly = true;
        type = lib.types.attrsOf wlib.types.stringable;
        # Makes plugins autobuilt from our inputs available with
        # `config.nvim-lib.neovimPlugins.<name_without_prefix>`
        default = config.nvim-lib.pluginsFromPrefix "neovim-plugin-" inputs;
      };
      pluginsFromPrefix = lib.mkOption {
        type = lib.types.raw;
        readOnly = true;
        default =
          prefix: inputs:
          lib.pipe inputs [
            builtins.attrNames
            (builtins.filter (s: lib.hasPrefix prefix s))
            (map (
              input:
              let
                name = lib.removePrefix prefix input;
              in
              {
                inherit name;
                value = config.nvim-lib.mkPlugin name inputs.${input};
              }
            ))
            builtins.listToAttrs
          ];
      };
    };
  };
  config = {
    # This submodule modifies both levels of your specs
    specMods =
      {
        # When this module is ran in an inner list,
        # this will contain `config` of the parent spec
        parentSpec ? null,
        # and this will contain `options`
        # otherwise they will be `null`
        parentOpts ? null,
        parentName ? null,
        # and then config from this one, as normal
        config,
        # and the other module arguments.
        ...
      }:
      {
        # you could use this to change defaults for the specs
        # config.collateGrammars = lib.mkDefault (parentSpec.collateGrammars or false);
        # config.autoconfig = lib.mkDefault (parentSpec.autoconfig or false);
        # config.runtimeDeps = lib.mkDefault (parentSpec.runtimeDeps or false);
        # config.pluginDeps = lib.mkDefault (parentSpec.pluginDeps or false);
        # or something more interesting like:
        # add a runtimePkgs field to the specs themselves
        options.runtimePkgs = options.runtimePkgs // {
          description = ''
            A runtimePkgs spec field to put packages on the PATH
            If the spec is disabled, this value will not be included in the resulting neovim derivation
          '';
        };
        # You could do this too
        # config.before = lib.mkDefault [ "INIT_MAIN" ];
      };
    runtimePkgs = config.specCollect (acc: v: acc ++ (v.runtimePkgs or [ ])) [ ];
  };
}
