{
  config,
  lib,
  ...
}:
let
  cfg = config.profiles.homelab;
in
{
  options = {
    profiles.homelab =
      with lib.types;
      let
        portType = either ints.u16 str;
        serviceType = submodule (
          { name, ... }:
          {
            options = {
              expose = lib.mkOption {
                description = "Whether to expose service";
                type = bool;
                default = true;
              };
              subdomain = lib.mkOption {
                description = "Subdomain of service";
                type = str;
                default = name;
              };
              serviceName = lib.mkOption {
                description = "Service module name";
                type = str;
                default = name;
              };
              port = lib.mkOption {
                description = "Internal port of service";
                type = portType;
              };
            };
          }
        );
      in
      {
        enable = lib.mkEnableOption "Homelab setup";
        rootService = lib.mkOption {
          type = portType;
        };
        services = lib.mkOption {
          type = attrsOf serviceType;
        };
        mediaDir = lib.mkOption {
          description = "Path to media directory";
          type = path;
          default = "/srv/media";
        };
      };
  };
  config = lib.mkIf cfg.enable {
    services = {
      # bazarr.enable = false;
      buildbot-nix = {
        master.enable = true;
        worker.enable = true;
      };
      caddy.enable = true;
      calibre-web.enable = true;
      glance.enable = true;
      grafana.enable = true;
      homepage-dashboard.enable = true;
      immich.enable = true;
      jellyfin.enable = true;
      # karakeep.enable = false; # https://github.com/NixOS/nixpkgs/issues/529285
      # lidarr.enable = false;
      miniflux.enable = true;
      # navidrome.enable = false;
      # ollama.enable = false;
      # open-webui.enable = false;
      prometheus.enable = true;
      prowlarr.enable = true;
      qbittorrent.enable = true;
      radarr.enable = true;
      seerr.enable = true;
      sonarr.enable = true;
      # suwayomi-server.enable = false;
    };
    profiles.homelab.rootService = config.services.glance.settings.server.port;
  };
}
