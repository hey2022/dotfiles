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
            cargo
            cargo-nextest
            clippy
            rust-analyzer
            rustc
            rustfmt
          ]
          ++ config.pre-commit.settings.enabledPackages;
      };
    };
}
