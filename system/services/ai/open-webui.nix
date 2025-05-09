{config, ...}: let
  cfg = config.services.open-webui;
in {
  services.open-webui = {
    enable = true;
    port = 11111;
  };
  services.caddy.virtualHosts."open-webui.${config.host.address}".extraConfig = ''
    reverse_proxy localhost:${toString cfg.port}
  '';
}
