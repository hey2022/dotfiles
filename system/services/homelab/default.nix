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
      jellyseerr.enable = true;
      qbittorrent.enable = true;
    };
  };
}
