{...}: {
  imports = [
    ./regreet.nix
    ./xdg
    ./gtk.nix
    ./mount.nix
    ./wluma.nix
    ../../modules/stylix.nix
  ];
  programs.wluma.enable = true;
}
