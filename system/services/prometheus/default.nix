{ config, ... }:

let
  cfg = config.services.prometheus;
in
{
  profiles.homelab.services.prometheus = {
    inherit (cfg) port;
  };
}
