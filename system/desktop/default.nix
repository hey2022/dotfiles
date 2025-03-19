{...}: {
  imports = [
    ./regreet.nix
    ./xdg
    ./gtk.nix
    ./mount.nix
    ./wluma.nix
    ./stylix.nix
    ./catppuccin.nix
  ];
  programs.wluma.enable = true;
}
