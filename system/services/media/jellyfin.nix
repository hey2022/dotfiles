{
  services.jellyfin = {
    enable = true;
    group = "media";
  };
  homelab.services.jellyfin = {
    port = 8096;
  };
}
