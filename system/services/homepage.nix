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
    postInstall = (old.postInstall or "") + "ln -s ${inputs.self}/wallpapers $out/share/homepage/public/images";
  });
in {
  services.homepage-dashboard = {
    inherit package;
    enable = true;
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
    bookmarks = [
      {
        Developer = [
          {
            Github = [
              {
                abbr = "GH";
                href = "https://github.com";
              }
            ];
          }
        ];
      }
    ];
  };
  environment.etc."homepage-dashboard/services.yaml".source = lib.mkForce (settingsFormat.generate "services.yaml"
    (lib.optionalAttrs (cfg.services != []) (lib.mapAttrsToList
      (groupName: services: {
        ${groupName} =
          lib.mapAttrsToList
          (serviceName: settings: {${serviceName} = settings;})
          services;
      })
      cfg.services)));
}
