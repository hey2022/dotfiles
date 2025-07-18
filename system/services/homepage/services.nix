{
  config,
  lib,
  ...
}:
let
  mkService =
    attrs@{
      name,
      icon ? "${name}.svg",
      url ? "https://${name}.${config.host.address}",
      ...
    }:
    lib.mkIf config.services.${name}.enable (
      {
        inherit icon;
        href = url;
      }
      // lib.optionalAttrs (attrs ? widget) {
        widget = attrs.widget // {
          type = name;
          inherit url;
        };
      }
    );
in
{
  services.homepage-dashboard.services = {
    services = {
      karakeep = mkService {
        name = "karakeep";
        widget = {
          key = "{{HOMEPAGE_VAR_KARAKEEP}}";
        };
      };
      miniflux = mkService {
        name = "miniflux";
        widget = {
          key = "{{HOMEPAGE_VAR_MINIFLUX}}";
        };
      };
    };
    status = {
      prometheus = mkService {
        name = "prometheus";
        url = "http://localhost:${toString config.services.prometheus.port}";
        widget = { };
      };
      grafana = mkService {
        name = "grafana";
        widget = {
          username = "admin";
          password = "{{HOMEPAGE_VAR_GRAFANA}}";
        };
      };
    };
    media = {
      lidarr = mkService {
        name = "lidarr";
        widget = {
          key = "{{HOMEPAGE_VAR_LIDARR}}";
        };
      };
      radarr = mkService {
        name = "radarr";
        widget = {
          key = "{{HOMEPAGE_VAR_RADARR}}";
        };
      };
      sonarr = mkService {
        name = "sonarr";
        widget = {
          key = "{{HOMEPAGE_VAR_SONARR}}";
        };
      };
      prowlarr = mkService {
        name = "prowlarr";
        widget = {
          key = "{{HOMEPAGE_VAR_PROWLARR}}";
        };
      };
      jellyfin = mkService {
        name = "jellyfin";
        widget = {
          key = "{{HOMEPAGE_VAR_JELLYFIN}}";
        };
      };
      navidrome = mkService {
        name = "navidrome";
        widget = {
          user = "admin";
          token = "{{HOMEPAGE_VAR_NAVIDROME}}";
          salt = "3cd981";
        };
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
