{ pkgs, ... }:
{
  imports = [
    ./espanso
    ./hypridle.nix
    ./hyprland
    ./hyprlock
    ./hyprsunset.nix
    ./niri
    ./quickshell
    ./swaylock.nix
    ./swaync.nix
    ./uwsm.nix
    ./waybar
    ./wayscriber.nix
    ./wlogout.nix
    ./wlsunset.nix
    ./wluma.nix
  ];
  home.packages = with pkgs; [
    brightnessctl
    grim
    playerctl
    slurp
    tesseract
    wev
    wl-clipboard
  ];
}
