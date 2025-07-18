{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];
  perSystem = {
    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        nixfmt.enable = true;
        prettier = {
          enable = true;
          excludes = [
            "secrets/*" # handled by sops
          ];
        };
        shellcheck.enable = true;
        taplo.enable = true;
      };
    };
  };
}
