{
  imports = [ ./beets.nix ];
  services.lidarr = {
    enable = true;
    group = "media";
  };
  homelab.services.lidarr = {
    port = 8686;
  };
}
