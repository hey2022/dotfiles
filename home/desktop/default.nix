{pkgs, ...}: {
  imports = [
    ../font
    ./catppuccin.nix
    ./copyq.nix
    ./fcitx5.nix
    ./gtk.nix
    ./icons.nix
    ./imv.nix
    ./qt.nix
    ./stylix.nix
    ./udiskie.nix
    ./wallpaper.nix
    ./wluma.nix
  ];
  home.packages = with pkgs; [
    desktop-file-utils
  ];
}
