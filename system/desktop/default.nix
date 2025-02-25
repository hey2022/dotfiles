{...}: {
  imports = [
    ./regreet.nix
    ./xdg
    ./gtk.nix
    ./mount.nix
    ./wluma.nix
    ../../common/stylix.nix
  ];
  programs.wluma.enable = true;
}
