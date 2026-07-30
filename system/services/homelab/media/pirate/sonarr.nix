{
  services.sonarr = {
    enable = true;
    group = "media";
  };
  profiles.homelab.services.sonarr = {
    port = 8989;
  };
}
