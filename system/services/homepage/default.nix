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
            path = "${inputs.self}/assets/wallpapers";
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
in {
  imports = [./services.nix];
  services.homepage-dashboard = {
    inherit package;
    enable = true;
    environmentFile = config.sops.secrets.homepage.path;
    openFirewall = true;
    allowedHosts = "localhost:8082,127.0.0.1:8082,${config.networking.hostName}:${toString config.services.homepage-dashboard.listenPort}";
    settings = {
      theme = "dark";
      color = "slate";
      background = "/images/alena-aenami-serenity-1k.jpg";
      cardBlur = "sm";
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
  environment.etc."homepage-dashboard/services.yaml".source = lib.mkForce (settingsFormat.generate "services.yaml" (convertServiceConfig cfg.services));
}
