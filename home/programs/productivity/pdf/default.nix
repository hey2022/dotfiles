{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./zathura.nix
  ];
  home.packages =
    with pkgs;
    lib.mkIf config.profiles.productivity.enable [
      ghostscript
      kdePackages.okular
      ocrmypdf
      poppler-utils
    ];
}
