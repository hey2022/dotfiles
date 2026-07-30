{
  services.radarr = {
    enable = true;
    group = "media";
  };
  profiles.homelab.services.radarr = {
    port = 7878;
  };
}
