{ inputs, ... }:

{
  imports = [ inputs.git-hooks-nix.flakeModule ];
  perSystem =
    { pkgs, ... }:
    {
      pre-commit.settings = {
        package = pkgs.prek;
        hooks = {
          treefmt.enable = true;
        };
      };
    };
}
