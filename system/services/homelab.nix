{ config, lib, ... }:

{
  imports = [
    ./caddy.nix
    ./glance.nix
    ./grafana.nix
    ./homepage
    ./karakeep.nix
    ./media
    ./miniflux.nix
    ./prometheus/prometheus.nix
  ];

  config = lib.mkIf config.homelab.enable {
    services = {
      jellyseerr.enable = true;
      qbittorrent.enable = true;
      suwayomi-server.enable = true;
    };
  };
}
