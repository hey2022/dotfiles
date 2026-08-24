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
      img2pdf
      ocrmypdf
      pdftk
      poppler-utils
    ];
}
