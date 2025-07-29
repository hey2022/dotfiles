{ config, ... }:
{
  imports = [
    ./bazarr.nix
    ./jellyfin.nix
    ./jellyseer.nix
    ./navidrome.nix
    ./qbittorrent.nix
    ./suwayomi.nix
    ./torrent
  ];
  users.groups.media = { };
  systemd.tmpfiles.rules = [
    "d ${config.homelab.mediaDir} 775 root media - -"
    "d ${config.homelab.mediaDir}/shows 775 root media - -"
    "d ${config.homelab.mediaDir}/shows/anime 775 root media - -"
    "d ${config.homelab.mediaDir}/shows/other 775 root media - -"
    "d ${config.homelab.mediaDir}/movies 775 root media - -"
    "d ${config.homelab.mediaDir}/movies/anime 775 root media - -"
    "d ${config.homelab.mediaDir}/movies/other 775 root media - -"
    "d ${config.homelab.mediaDir}/music 775 root media - -"
    "d ${config.homelab.mediaDir}/downloads 775 root media - -"
  ];
}
