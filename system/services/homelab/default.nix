{ config, lib, ... }:

{
  imports = [
    ./ai
    ./caddy.nix
    ./cloudflared.nix
    ./glance.nix
    ./grafana.nix
    ./homepage
    ./karakeep.nix
    ./media
    ./miniflux.nix
    ./prometheus.nix
  ];

  config = lib.mkIf config.homelab.enable {
    services = {
      bazarr.enable = true;
      jellyseerr.enable = true;
      qbittorrent.enable = true;
      suwayomi-server.enable = true;
    };
  };
}
