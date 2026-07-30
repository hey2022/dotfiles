{ config, ... }:

let
  cfg = config.services.seerr;
in
{
  services.seerr = { };
  homelab.services.seerr = {
    inherit (cfg) port;
  };
}
