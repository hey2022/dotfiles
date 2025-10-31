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
      kdePackages.okular
      ocrmypdf
      poppler-utils
    ];
}
