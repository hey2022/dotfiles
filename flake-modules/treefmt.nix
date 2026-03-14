{ inputs, ... }:

{
  imports = [ inputs.treefmt-nix.flakeModule ];
  perSystem =
    { pkgs, lib, ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";
        settings = {
          excludes = [
            "secrets/*" # handled by sops
          ];
        };
        programs = {
          kdlfmt.enable = true;
          nixfmt.enable = true;
          prettier.enable = true;
          shellcheck.enable = true;
          taplo.enable = true;
          yamlfmt.enable = true;
        };
        settings.formatter = {
          qmlformat = {
            command = lib.getExe' pkgs.qt6Packages.qtdeclarative "qmlformat";
            options = [ "-i" ];
            includes = [ "*.qml" ];
          };
          stylua = {
            command = lib.getExe pkgs.stylua;
            includes = [ "*.lua" ];
          };
        };
      };
    };
}
