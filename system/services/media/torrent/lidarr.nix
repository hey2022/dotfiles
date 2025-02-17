{...}: {
  services.lidarr = {
    enable = true;
    group = "media";
    openFirewall = true;
  };
  services.homepage-dashboard.services.media.lidarr = {
    icon = "lidarr.svg";
    href = "http://localhost:8686";
  };
}
