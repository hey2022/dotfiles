{ config, ... }:

let
  cfg = config.services.seerr;
in
{
  services.seerr = { };
  profiles.homelab.services.seerr = {
    inherit (cfg) port;
  };
}
