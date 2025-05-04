{...}: let
  port = 8081;
in {
  services.miniflux = {
    enable = true;
    adminCredentialsFile = /etc/nixos/miniflux-admin-credentials;
    config = {
      LISTEN_ADDR = "0.0.0.0:${toString port}";
    };
  };
  networking.firewall = {
    allowedTCPPorts = [port];
  };
}
