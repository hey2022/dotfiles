{ config, ... }:
let
  port = 8081;
in
{
  services.miniflux = {
    enable = true;
    adminCredentialsFile = /etc/nixos/miniflux-admin-credentials;
    config = {
      LISTEN_ADDR = "0.0.0.0:${toString port}";
    };
  };
  services.caddy.virtualHosts."*.${config.host.address}".extraConfig = ''
    handle @miniflux {
        header {
            Content-Security-Policy "frame-ancestors 'self' https://${config.host.address}"
        }
    }
  '';
  homelab.services.miniflux = {
    inherit port;
  };
}
