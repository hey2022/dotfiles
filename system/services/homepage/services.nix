{
  config,
  lib,
  ...
}:
let
  mkService =
    {
      name,
      serviceName ? name,
      icon ? "${name}.svg",
      url ? "https://${name}.${config.host.address}",
      widget ? null,
    }:
    lib.mkIf config.services.${serviceName}.enable (
      {
        inherit icon;
        href = url;
      }
      // lib.optionalAttrs (widget != null) {
        widget = widget // {
          type = name;
          url = "http://localhost:${toString config.homelab.services.${name}.port}";
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
        url = null;
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
      bazarr = mkService {
        name = "bazarr";
        widget = {
          key = "{{HOMEPAGE_VAR_BAZARR}}";
        };
      };
      jellyfin = mkService {
        name = "jellyfin";
        widget = {
          key = "{{HOMEPAGE_VAR_JELLYFIN}}";
          enableBlocks = true;
          enableNowPlaying = false;
        };
      };
      jellyseerr = mkService {
        name = "jellyseerr";
        widget = {
          key = "{{HOMEPAGE_VAR_JELLYSEERR}}";
        };
      };
      qbittorrent = mkService {
        name = "qbittorrent";
        widget = {
          username = "admin";
          password = "{{HOMEPAGE_VAR_QBITTORRENT}}";
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
