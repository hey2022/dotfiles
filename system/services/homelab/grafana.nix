{ config, ... }:
let
  cfg = config.services.grafana;
in
{
  services.grafana = {
    enable = true;
    settings = {
      server.http_port = 9191;
      security = {
        allow_embedding = true;
      };
    };
    provision = {
      enable = true;
      datasources.settings.datasources = [
        {
          name = "Prometheus";
          type = "prometheus";
          url = "http://${config.services.prometheus.listenAddress}:${toString config.services.prometheus.port}";
        }
      ];
    };
  };
  homelab.services.grafana = {
    port = cfg.settings.server.http_port;
  };
}
