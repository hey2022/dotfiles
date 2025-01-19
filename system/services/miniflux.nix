{...}: {
  services.miniflux = {
    enable = true;
    adminCredentialsFile = /etc/nixos/miniflux-admin-credentials;
    config = {
      LISTEN_ADDR = "localhost:8081";
    };
  };
}
