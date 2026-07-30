{ config, ... }:
let
  cfg = config.services.open-webui;
in
{
  services.open-webui = {
    port = 11111;
  };
  profiles.homelab.services.open-webui = {
    inherit (cfg) port;
  };
}
