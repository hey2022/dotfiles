{...}: {
  imports = [./jellyfin.nix ./navidrome.nix ./torrent];
  users.groups.media = {};
}
