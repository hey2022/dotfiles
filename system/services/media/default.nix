{ config, ... }:
{
  imports = [
    ./jellyfin.nix
    ./navidrome.nix
    ./torrent
  ];
  users.groups.media = { };
  systemd.tmpfiles.rules = [
    "d ${config.homelab.mediaDir} 775 root media - -"
    "d ${config.homelab.mediaDir}/anime 775 root media - -"
    "d ${config.homelab.mediaDir}/music 775 root media - -"
    "d ${config.homelab.mediaDir}/downloads 775 root media - -"
  ];
}
