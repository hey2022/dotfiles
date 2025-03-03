{...}: {
  imports = [
    ./regreet.nix
    ./xdg
    ./gtk.nix
    ./mount.nix
    ./wluma.nix
    ./stylix.nix
  ];
  programs.wluma.enable = true;
}
