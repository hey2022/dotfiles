{ pkgs, ... }:
{
  imports = [
    ./hypridle.nix
    ./hyprland
    ./hyprlock
    ./niri
    ./quickshell
    ./swaylock.nix
    ./swaync.nix
    ./waybar
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
