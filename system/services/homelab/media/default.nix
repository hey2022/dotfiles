{
  imports = [
    ./bazarr.nix
    ./calibre.nix
    ./immich.nix
    ./jellyfin.nix
    ./jellyseer.nix
    ./navidrome.nix
    ./qbittorrent.nix
    ./suwayomi.nix
    ./torrent
  ];
  users.groups.media = { };
}
