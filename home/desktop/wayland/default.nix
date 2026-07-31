{ pkgs, ... }:
{
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
