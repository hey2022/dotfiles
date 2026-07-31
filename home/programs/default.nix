{ pkgs, pkgs-local, ... }:

{
  home.packages = [
    pkgs-local.keepassxc-snapshot
    pkgs.czkawka
  ];
}
