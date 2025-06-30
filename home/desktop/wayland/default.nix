{pkgs, ...}: {
  imports = [
    ./wlogout.nix
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
