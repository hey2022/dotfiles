{
  config,
  lib,
  pkgs,
  pkgs-local,
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
      pkgs-local.pdf-open
    ];
}
