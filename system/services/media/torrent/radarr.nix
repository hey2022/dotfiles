{...}: {
  services.radarr = {
    enable = true;
    group = "media";
  };
  services.homepage-dashboard.services.media.radarr = {
    href = "http://localhost:7878";
  };
}
