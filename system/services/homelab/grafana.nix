{ config, lib, ... }:
let
  cfg = config.services.grafana;
in
{
  config = lib.mkIf cfg.enable {
    services.grafana = {
      settings = {
        server.http_port = 9191;
        security = {
          allow_embedding = true;
          secret_key = "$__file{${config.sops.secrets."grafana".path}}";
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
    profiles.homelab.services.grafana = {
      port = cfg.settings.server.http_port;
    };
    sops.secrets."grafana" = {
      owner = "grafana";
    };
  };
}
