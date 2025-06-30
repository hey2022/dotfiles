{pkgs, ...}: {
  imports = [
    ../font
    ./activitywatch.nix
    ./catppuccin.nix
    ./copyq.nix
    ./fcitx5.nix
    ./gtk.nix
    ./hyprlock
    ./icons.nix
    ./imv.nix
    ./pipewire.nix
    ./qt.nix
    ./stylix.nix
    ./udiskie.nix
    ./wallpaper.nix
    ./wluma.nix
    ./xdg
  ];
  home.packages = with pkgs; [
    desktop-file-utils
    localsend
  ];
}
