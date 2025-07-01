{ ... }:
{
  imports = [
    ./jellyfin.nix
    ./navidrome.nix
    ./torrent
  ];
  users.groups.media = { };
  systemd.tmpfiles.rules = [
    "d /var/lib/media 775 root media -"
    "d /var/lib/media/anime 775 root media - -"
    "d /var/lib/media/music 775 root media - -"
    "d /var/lib/media/downloads 775 root media - -"
  ];
}
