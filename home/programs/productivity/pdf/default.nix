{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./zathura.nix
    ./sioyek.nix
  ];
  home.packages =
    with pkgs;
    lib.mkIf config.profiles.productivity.enable [
      ghostscript
      ocrmypdf
      poppler-utils
    ];
}
