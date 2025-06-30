{pkgs, ...}: {
  imports = [
    ../font
    ./activitywatch.nix
    ./catppuccin.nix
    ./copyq.nix
    ./fcitx5.nix
    ./gammastep.nix
    ./gtk.nix
    ./icons.nix
    ./imv.nix
    ./launchers
    ./pipewire.nix
    ./qt.nix
    ./stylix.nix
    ./terminal
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
