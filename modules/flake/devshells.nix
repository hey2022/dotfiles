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
          packages =
            with pkgs;
            [
              qt6.qtdeclarative
            ]
            ++ config.pre-commit.settings.enabledPackages;
        };
        typst = pkgs.mkShell {
          packages = with pkgs; [
            tinymist
            typst
            typstyle
          ];
        };
        python =
          let
            system-libraries = with pkgs; [
              libx11
            ];
          in
          pkgs.mkShell {
            shellHook = ''
              export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath system-libraries}''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
            '';
            packages = with pkgs; [
              basedpyright
              python3
              uv
            ];
          };
      };
    };
}
