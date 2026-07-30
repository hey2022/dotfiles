{
  imports = [
    ./calibre.nix
    ./immich.nix
    ./torrent
  ];
  users.groups.media = { };
}
