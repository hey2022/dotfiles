{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.homepage-dashboard;
  settingsFormat = pkgs.formats.yaml {};
  package = pkgs.homepage-dashboard.overrideAttrs (old: {
    postInstall =
      (old.postInstall or "")
      + ''
        ln -s ${
          builtins.path {
            path = "${inputs.self}/wallpapers";
            name = "homepage-wallpapers";
          }
        } $out/share/homepage/public/images
      '';
  });
  convertServiceConfig = option: (lib.optionalAttrs (option != []) (lib.mapAttrsToList
    (groupName: services: {
      ${groupName} =
        lib.mapAttrsToList
        (serviceName: settings: {${serviceName} = settings;})
        services;
    })
    option));
  convertBookmarkConfig = option:
    lib.optionalAttrs (option != []) (lib.mapAttrsToList
      (groupName: bookmarks: {
        ${groupName} =
          lib.mapAttrsToList
          (bookmarkName: settings: {
            ${bookmarkName} = [settings];
          })
          bookmarks;
      })
      option);
in {
  services.homepage-dashboard = {
    inherit package;
    enable = true;
    openFirewall = true;
    settings = {
      theme = "dark";
      color = "slate";
      background = "/images/alena-aenami-serenity-1k.jpg";
      cardBlur = "sm";
      target = "_self";
    };
    widgets = [
      {
        resources = {
          cpu = true;
          disk = "/";
          memory = true;
        };
      }
      {
        datetime = {
          format = {
            dateStyle = "short";
            timeStyle = "short";
          };
        };
      }
      {
        search = {
          provider = "custom";
          url = "https://priv.au/search?q=";
        };
      }
      {
        openmeteo = {
          latitude = 23.021;
          longitude = 113.752;
          units = "metric";
          cache = "5";
        };
      }
    ];
  };
  systemd.services.homepage-dashboard.environment = {
    HOMEPAGE_ALLOWED_HOSTS = "${config.networking.hostName}:${toString config.services.homepage-dashboard.listenPort}";
  };
  environment.etc."homepage-dashboard/services.yaml".source = lib.mkForce (settingsFormat.generate "services.yaml" (convertServiceConfig cfg.services));
  environment.etc."homepage-dashboard/bookmarks.yaml".source = lib.mkForce (settingsFormat.generate "bookmarks.yaml" (convertBookmarkConfig cfg.bookmarks));
}
