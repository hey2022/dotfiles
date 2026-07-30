{
  imports = [ ./beets.nix ];
  services.lidarr = {
    group = "media";
  };
  profiles.homelab.services.lidarr = {
    port = 8686;
  };
}
