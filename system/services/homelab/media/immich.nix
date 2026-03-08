{ config, lib, ... }:

let
  cfg = config.services.immich;
in
{
  config = lib.mkIf cfg.enable {
    services.immich = {
      group = "media";
      mediaLocation = "${config.homelab.mediaDir}/immich";
      secretsFile = config.sops.secrets."immich".path;
      host = "::";
    };
    homelab.services.immich = {
      inherit (cfg) port;
    };
  };
}
