{
  config,
  lib,
  pkgs,
  ...
}:
let
  inkscape = pkgs.inkscape-with-extensions.override {
    inkscapeExtensions = with pkgs.inkscape-extensions; [
      textext
    ];
  };
in
{
  home.packages = lib.mkIf config.profiles.productivity.enable [ inkscape ];
}
