{ ... }:
{
  imports = [
    ./catppuccin.nix
    ./fcitx5.nix
    ./gtk.nix
    ./mount.nix
    ./regreet.nix
    ./stylix.nix
    ./wluma.nix
    ./xdg
  ];
  programs.wluma.enable = false;
}
