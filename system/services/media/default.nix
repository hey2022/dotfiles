{...}: {
  imports = [./jellyfin.nix ./torrent];
  users.groups.media = {};
}
