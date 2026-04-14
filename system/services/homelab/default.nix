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
      calibre-web.enable = true;
      glance.enable = true;
      immich.enable = true;
      miniflux.enable = true;
      qbittorrent.enable = true;
      seerr.enable = true;
    };
    homelab.rootService = config.services.glance.settings.server.port;
  };
}
