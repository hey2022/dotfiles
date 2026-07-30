{ config, ... }:
let
  cfg = config.services.navidrome;
in
{
  services.navidrome = {
    group = "media";
    settings = {
      MusicFolder = "${config.homelab.mediaDir}/music";
    };
  };
  homelab.services.navidrome = {
    port = cfg.settings.Port;
  };
}
