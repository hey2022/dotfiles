{
  services.jellyfin = {
    enable = true;
    group = "media";
  };
  profiles.homelab.services.jellyfin = {
    port = 8096;
  };
}
