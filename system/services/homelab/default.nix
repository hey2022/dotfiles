{ config, lib, ... }:

{
  imports = [
    ./ai
    ./buildbot-master.nix
    ./buildbot-worker.nix
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
      buildbot-nix = {
        master.enable = true;
        worker.enable = true;
      };
      bazarr.enable = true;
      jellyseerr.enable = true;
      miniflux.enable = true;
      qbittorrent.enable = true;
      suwayomi-server.enable = true;
    };
  };
}
