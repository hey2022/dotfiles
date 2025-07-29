{ config, ... }:

let
  cfg = config.services.jellyseerr;
in
{
  services.jellyseerr = { };
  homelab.services.jellyseerr = {
    inherit (cfg) port;
  };
}
