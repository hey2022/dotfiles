{config, ...}: let
  cfg = config.services.grafana;
in {
  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_addr = "0.0.0.0";
        http_port = 9191;
      };
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
  networking.firewall = {
    allowedTCPPorts = [cfg.settings.server.http_port];
  };
}
