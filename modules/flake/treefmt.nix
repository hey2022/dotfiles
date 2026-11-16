{ inputs, ... }:

{
  imports = [ inputs.treefmt-nix.flakeModule ];
  perSystem =
    { pkgs, lib, ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";
        settings = {
          excludes = [
            "secrets/*" # handled by sops
            "home/desktop/mapping/input-remapper/*"
            "modules/flake/templates/*/.github/workflows/*.yaml"
          ];
        };
        programs = {
          kdlfmt.enable = true;
          mdformat = {
            enable = true;
            plugins = ps: [
              ps.mdformat-frontmatter
              ps.mdformat-gfm
            ];
          };
          nixfmt.enable = true;
          prettier.enable = true;
          shellcheck.enable = true;
          taplo.enable = true;
          yamlfmt.enable = true;
        };
        settings.formatter = {
          prettier = {
            excludes = [ "*.md" ];
          };
          qmlformat = {
            command = lib.getExe' pkgs.qt6Packages.qtdeclarative "qmlformat";
            options = [ "-i" ];
            includes = [ "*.qml" ];
          };
          stylua = {
            command = lib.getExe pkgs.stylua;
            includes = [ "*.lua" ];
          };
        };
      };
    };
}
