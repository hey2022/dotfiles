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
    bookmarks = {
      Developer = {
        Github = {
          abbr = "GH";
          href = "https://github.com";
        };
      };
      School = {
        Xiaobao = {
          abbr = "XB";
          href = "https://tsinglanstudent.schoolis.cn";
        };
        Teams = {
          abbr = "TM";
          href = "https://teams.microsoft.com";
        };
      };
    };
  };
  environment.etc."homepage-dashboard/services.yaml".source = lib.mkForce (settingsFormat.generate "services.yaml" (convertServiceConfig cfg.services));
  environment.etc."homepage-dashboard/bookmarks.yaml".source = lib.mkForce (settingsFormat.generate "bookmarks.yaml" (convertBookmarkConfig cfg.bookmarks));
}
