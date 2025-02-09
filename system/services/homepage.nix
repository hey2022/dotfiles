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
