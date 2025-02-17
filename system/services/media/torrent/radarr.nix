{...}: {
  services.radarr = {
    enable = true;
    group = "media";
    openFirewall = true;
  };
  services.homepage-dashboard.services.media.radarr = {
    icon = "radarr.svg";
    href = "http://localhost:7878";
  };
}
