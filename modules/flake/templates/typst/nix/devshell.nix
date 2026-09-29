{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        shellHook = ''
          ${config.pre-commit.shellHook}
        '';
        packages =
          with pkgs;
          [
            tinymist
            typst
            typstyle
          ]
          ++ config.pre-commit.settings.enabledPackages;
      };
    };
}
