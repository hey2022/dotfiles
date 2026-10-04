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
          '';
          packages = config.pre-commit.settings.enabledPackages;
        };
        typst = pkgs.mkShell {
          packages = with pkgs; [
            tinymist
            typst
            typstyle
          ];
        };
        python = pkgs.mkShell {
          packages = with pkgs; [
            basedpyright
            python3
            uv
          ];
        };
      };
    };
}
