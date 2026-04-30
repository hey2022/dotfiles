{ inputs, ... }:

{
  imports = [ inputs.git-hooks-nix.flakeModule ];
  perSystem =
    { config, pkgs, ... }:
    {
      pre-commit.settings = {
        package = pkgs.prek;
        hooks = {
          treefmt.enable = true;
        };
      };
      devShells.default = config.pre-commit.devShell;
    };
}
