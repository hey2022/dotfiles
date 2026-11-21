{ pkgs, pkgs-local, ... }:
{
  home.packages = [
    pkgs-local.limusic
    pkgs.songrec
  ];
}
