{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.homepage-dashboard;
  settingsFormat = pkgs.formats.yaml { };
  package = pkgs.homepage-dashboard.overrideAttrs (old: {
    postInstall = (old.postInstall or "") + ''
      ln -s ${
        builtins.path {
          path = "${inputs.self}/assets/wallpapers";
          name = "homepage-wallpapers";
        }
      } $out/share/homepage/public/images
    '';
  });
  convertServiceConfig =
    option:
    (lib.optionalAttrs (option != [ ]) (
      lib.mapAttrsToList (groupName: services: {
        ${groupName} = lib.mapAttrsToList (serviceName: settings: { ${serviceName} = settings; }) services;
      }) option
    ));
in
{
  imports = [ ./services.nix ];
  services.homepage-dashboard = {
    inherit package;
    enable = true;
    environmentFile = config.sops.secrets.homepage.path;
    allowedHosts = "localhost:8082,127.0.0.1:8082,homepage.${config.host.address}";
    settings = {
      theme = "dark";
      color = "slate";
      background = "/images/alena-aenami-serenity-1k.jpg";
      cardBlur = "sm";
      layout = {
        media = {
          style = "row";
          columns = 4;
        };
      };
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
          provider = "duckduckgo";
          showSearchSuggestions = true;
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
  environment.etc."homepage-dashboard/services.yaml".source = lib.mkForce (
    settingsFormat.generate "services.yaml" (convertServiceConfig cfg.services)
  );
  homelab.services.homepage = {
    port = cfg.listenPort;
    serviceName = "homepage-dashboard";
  };
}
