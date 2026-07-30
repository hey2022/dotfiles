{ config, ... }:

let
  cfg = config.services.bazarr;
in
{
  services.bazarr = {
    group = "media";
  };
  profiles.homelab.services.bazarr = {
    port = cfg.listenPort;
  };
}
