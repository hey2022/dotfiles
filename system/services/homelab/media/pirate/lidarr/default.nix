{
  imports = [ ./beets.nix ];
  services.lidarr = {
    group = "media";
  };
  homelab.services.lidarr = {
    port = 8686;
  };
}
