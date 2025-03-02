{config, ...}: let
  hostname = config.networking.hostName;
in {
  services.homepage-dashboard.services = {
    media = {
      lidarr = {
        icon = "lidarr.svg";
        href = "http://${hostname}:8686";
      };
      radarr = {
        icon = "radarr.svg";
        href = "http://${hostname}:7878";
      };
      sonarr = {
        icon = "sonarr.svg";
        href = "http://${hostname}:8989";
      };
      prowlarr = {
        icon = "prowlarr.svg";
        href = "http://${hostname}:9696";
      };
      jellyfin = {
        icon = "jellyfin.svg";
        href = "http://${hostname}:8096";
      };
      navidrome = {
        icon = "navidrome.svg";
        href = "http://${hostname}:4533";
      };
    };
    AI = {
      open-webui = {
        icon = "open-webui.webp";
        href = "http://${hostname}:11111";
      };
    };
  };
}
