{
  imports = [
    ./catppuccin.nix
    ./display-manager
    ./fcitx5.nix
    ./gtk.nix
    ./mount.nix
    ./stylix.nix
    ./sunshine.nix
    ./wayland
  ];
  services.gvfs.enable = true;
}
