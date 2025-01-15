{...}: {
  imports = [
    ./regreet.nix
    ./xdg
    ./gtk.nix
    ./mount.nix
    ./wluma.nix
    ../../modules/stylix.nix
  ];
  services.wluma.enable = true;
}
