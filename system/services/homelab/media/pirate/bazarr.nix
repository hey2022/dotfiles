{ config, ... }:

let
  cfg = config.services.bazarr;
in
{
  services.bazarr = {
    group = "media";
  };
  homelab.services.bazarr = {
    port = cfg.listenPort;
  };
}
