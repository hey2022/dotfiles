{ inputs, ... }:

{
  imports = [ inputs.git-hooks-nix.flakeModule ];
  perSystem =
    { config, pkgs, ... }:
    {
      devShells = {
        default = pkgs.mkShell {
          shellHook = ''
            ${config.pre-commit.shellHook}
            export JJ_PRE_PUSH_CHECKER=prek
          '';
          packages = config.pre-commit.settings.enabledPackages;
        };
      };
    };
}
