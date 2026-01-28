# TODO: add quickshell widgets
{ pkgs, ... }:
{
  imports = [
    ../font
    ./activitywatch.nix
    ./catppuccin.nix
    ./clipboard
    ./fcitx5.nix
    ./gammastep.nix
    ./gtk.nix
    ./imv.nix
    ./launchers
    ./pipewire.nix
    ./qt.nix
    ./stylix.nix
    ./terminal
    ./theme.nix
    ./udiskie.nix
    ./wallpaper
    ./wlsunset.nix
    ./wluma.nix
    ./xdg
  ];
  home.packages = with pkgs; [
    desktop-file-utils
    localsend
    moonlight-qt
  ];
}
