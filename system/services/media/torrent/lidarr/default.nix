{
  imports = [ ./beets.nix ];
  services.lidarr = {
    enable = true;
    group = "media";
  };
  hostedServices.lidarr = 8686;
}
