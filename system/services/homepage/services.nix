{
  config,
  lib,
  ...
}: let
  hostname = config.networking.hostName;

  mkService = {
    name,
    icon ? "${name}.svg",
    port ? config.services.${name}.port,
    ...
  }:
    lib.mkIf config.services.${name}.enable {
      icon = icon;
      href = "http://${hostname}:${toString port}";
    };
in {
  services.homepage-dashboard.services = {
    services = {
      karakeep = mkService {
        name = "karakeep";
        port = config.services.karakeep.extraEnvironment.PORT;
      };
    };
    status = {
      prometheus = mkService {
        name = "prometheus";
      };
      grafana = mkService {
        name = "grafana";
        port = config.services.grafana.settings.server.http_port;
      };
    };
    media = {
      lidarr = mkService {
        name = "lidarr";
        port = 8686;
      };
      radarr = mkService {
        name = "radarr";
        port = 7878;
      };
      sonarr = mkService {
        name = "sonarr";
        port = 8989;
      };
      prowlarr = mkService {
        name = "prowlarr";
        port = 9696;
      };
      jellyfin = mkService {
        name = "jellyfin";
        port = 8096;
      };
      navidrome = mkService {
        name = "navidrome";
        port = config.services.navidrome.settings.Port;
      };
    };
    AI = {
      open-webui = mkService {
        name = "open-webui";
        icon = "open-webui.webp";
      };
    };
  };
}
