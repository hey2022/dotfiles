{
  config,
  lib,
  ...
}: let
  hostname = config.networking.hostName;

  mkService = attrs @ {
    name,
    icon ? "${name}.svg",
    port ? config.services.${name}.port,
    ...
  }: let
    url = "http://${hostname}:${toString port}";
  in
    lib.mkIf config.services.${name}.enable ({
        icon = icon;
        href = url;
      }
      // lib.optionalAttrs (attrs ? widget) {
        widget =
          attrs.widget
          // {
            type = name;
            inherit url;
          };
      });
in {
  services.homepage-dashboard.services = {
    services = {
      karakeep = mkService {
        name = "karakeep";
        port = config.services.karakeep.extraEnvironment.PORT;
        widget = {
          key = "{{HOMEPAGE_VAR_KARAKEEP}}";
        };
      };
      miniflux = mkService {
        name = "miniflux";
        port = 8081;
      };
    };
    status = {
      prometheus = mkService {
        name = "prometheus";
        widget = {};
      };
      grafana = mkService {
        name = "grafana";
        port = config.services.grafana.settings.server.http_port;
        widget = {
          username = "admin";
          password = "{{HOMEPAGE_VAR_GRAFANA}}";
        };
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
        widget = {
          key = "{{HOMEPAGE_VAR_SONARR}}";
        };
      };
      prowlarr = mkService {
        name = "prowlarr";
        port = 9696;
      };
      jellyfin = mkService {
        name = "jellyfin";
        port = 8096;
        widget = {
          key = "{{HOMEPAGE_VAR_JELLYFIN}}";
        };
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
