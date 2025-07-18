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
  services.caddy.virtualHosts."miniflux.${config.host.address}".extraConfig = ''
    header {
        Content-Security-Policy "frame-ancestors 'self' https://${config.host.address}"
    }
  '';
  hostedServices.miniflux = port;
}
