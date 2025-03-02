{...}: {
  services.open-webui = {
    enable = true;
    openFirewall = true;
    host = "0.0.0.0";
    port = 11111;
  };
}
