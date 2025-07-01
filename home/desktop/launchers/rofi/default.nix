{ pkgs, ... }:
{
  programs.rofi = {
    package = pkgs.rofi-wayland;
  };
}
