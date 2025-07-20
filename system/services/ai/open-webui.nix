{ config, lib, ... }:
let
  cfg = config.services.open-webui;
in
{
  config = lib.mkIf config.profiles.ai.enable {
    services.open-webui = {
      enable = true;
      port = 11111;
    };
    homelab.services.open-webui = {
      port = cfg.port;
    };
  };
}
