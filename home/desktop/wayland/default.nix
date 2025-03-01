{pkgs, ...}: {
  home.packages = with pkgs; [
    wlogout
    grim
    slurp
    tesseract
    wl-clipboard
    playerctl
    brightnessctl
  ];
}
