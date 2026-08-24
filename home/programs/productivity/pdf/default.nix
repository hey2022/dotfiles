{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages =
    with pkgs;
    lib.mkIf config.profiles.productivity.enable [
      ghostscript
      ocrmypdf
      poppler-utils
      img2pdf
    ];
}
