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
  services.caddy.virtualHosts."navidrome.${config.host.address}".extraConfig = ''
    header {
        Content-Security-Policy "frame-ancestors 'self' https://${config.host.address}"
    }
  '';
  hostedServices.navidrome = cfg.settings.Port;
}
