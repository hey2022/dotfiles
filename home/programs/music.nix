{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pear-desktop
    songrec
  ];
}
