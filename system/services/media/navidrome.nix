{ config, ... }:
let
  cfg = config.services.navidrome;
in
{
  services.navidrome = {
    enable = true;
    group = "media";
    settings = {
      MusicFolder = "/var/lib/media/music";
    };
  };
  homelab.services.navidrome = {
    port = cfg.settings.Port;
  };
}
