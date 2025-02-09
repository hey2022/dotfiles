{...}: {
  services.jellyfin = {
    enable = true;
    group = "media";
  };
  services.homepage-dashboard.services.media.jellyfin = {
    icon = "jellyfin.svg";
    href = "http://localhost:8096";
  };
}
