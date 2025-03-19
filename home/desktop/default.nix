{pkgs, ...}: {
  imports = [
    ./icons.nix
    ./stylix.nix
    ./catppuccin.nix
    ./wluma.nix
    ./copyq.nix
    ./imv.nix
    ../font
    ./fcitx5.nix
  ];
  home.packages = with pkgs; [
    desktop-file-utils
  ];
}
