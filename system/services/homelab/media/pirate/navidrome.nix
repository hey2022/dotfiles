{ config, ... }:
let
  cfg = config.services.navidrome;
in
{
  services.navidrome = {
    group = "media";
    settings = {
      MusicFolder = "${config.profiles.homelab.mediaDir}/music";
    };
  };
  profiles.homelab.services.navidrome = {
    port = cfg.settings.Port;
  };
}
