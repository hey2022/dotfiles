{ pkgs, ... }:
{
  imports = [
    ./hyprland
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
    grim
    slurp
    tesseract
    wl-clipboard
    playerctl
    brightnessctl
  ];
}
