{ inputs, ... }:

{
  imports = [ inputs.git-hooks-nix.flakeModule ];
  perSystem =
    { pkgs, ... }:
    {
      pre-commit.settings = {
        package = pkgs.prek;
        default_stages = [
          "pre-commit"
          "pre-push"
        ];
        hooks = {
          treefmt.enable = true;
        };
      };
    };
}
