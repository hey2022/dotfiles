{ pkgs, ... }:
{
  imports = [
    ./espanso
    ./hypridle.nix
    ./hyprland
    ./hyprlock
    ./niri
    ./quickshell
    ./swaylock.nix
    ./swaync.nix
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
