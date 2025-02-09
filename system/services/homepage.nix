{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.homepage-dashboard;
  settingsFormat = pkgs.formats.yaml {};
in {
  services.homepage-dashboard = {
    enable = true;
    settings = {
      theme = "dark";
      color = "slate";
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
    ];
  };
  environment.etc."homepage-dashboard/services.yaml".source = lib.mkForce (settingsFormat.generate "services.yaml"
    (lib.mapAttrsToList
      (groupName: services: {
        ${groupName} =
          lib.mapAttrsToList
          (serviceName: settings: {${serviceName} = settings;})
          services;
      })
      cfg.services));
}
