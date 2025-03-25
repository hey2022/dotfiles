{pkgs, ...}: {
  imports = [
    ../font
    ./catppuccin.nix
    ./copyq.nix
    ./fcitx5.nix
    ./gtk.nix
    ./icons.nix
    ./imv.nix
    ./stylix.nix
    ./wluma.nix
  ];
  home.packages = with pkgs; [
    desktop-file-utils
  ];
}
