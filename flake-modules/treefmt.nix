{ inputs, ... }:

{
  imports = [ inputs.treefmt-nix.flakeModule ];
  perSystem =
    { pkgs, lib, ... }:
    {
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
          kdlfmt.enable = true;
        };
        settings.formatter = {
          qmlformat = {
            command = lib.getExe' pkgs.qt6Packages.qtdeclarative "qmlformat";
            options = [ "-i" ];
            includes = [ "*.qml" ];
          };
        };
      };
    };
}
