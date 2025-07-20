{ config, ... }:
let
  cfg = config.services.navidrome;
in
{
  services.navidrome = {
    enable = true;
    group = "media";
    settings = {
      MusicFolder = "/var/lib/media/music";
    };
  };
  services.caddy.virtualHosts."*.${config.host.address}".extraConfig = ''
    handle @navidrome {
        header {
            Content-Security-Policy "frame-ancestors 'self' https://${config.host.address}"
        }
    }
  '';
  homelab.services.navidrome = {
    port = cfg.settings.Port;
  };
}
