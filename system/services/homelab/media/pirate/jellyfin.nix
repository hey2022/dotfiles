{
  services.jellyfin = {
    group = "media";
  };
  profiles.homelab.services.jellyfin = {
    port = 8096;
  };
}
