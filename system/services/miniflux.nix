{...}: {
  services.miniflux = {
    enable = true;
    adminCredentialsFile = /etc/nixos/miniflux-admin-credentials;
    config = {
      LISTEN_ADDR = "0.0.0.0:8081";
    };
  };
}
