{...}: {
  services.radarr = {
    enable = true;
    group = "media";
  };
  services.homepage-dashboard.services.media.radarr = {
    icon = "radarr.svg";
    href = "http://localhost:7878";
  };
}
