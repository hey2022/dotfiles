let
  port = 8081;
in
{
  services.miniflux = {
    adminCredentialsFile = /etc/nixos/miniflux-admin-credentials;
    config = {
      LISTEN_ADDR = "0.0.0.0:${toString port}";
    };
  };
  profiles.homelab.services.miniflux = {
    inherit port;
  };
}
