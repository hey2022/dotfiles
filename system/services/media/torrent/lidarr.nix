{...}: {
  services.lidarr = {
    enable = true;
    group = "media";
  };
  services.homepage-dashboard.services.media.lidarr = {
    href = "http://localhost:8686";
  };
}
