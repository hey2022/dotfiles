{ config, lib, ... }:

let
  cfg = config.services.harmonia.cache;
in
{
  config = lib.mkIf cfg.enable {
    services.harmonia = {
      cache = {
        signKeyPaths = [ config.sops.secrets.harmonia-key.path ];
        settings = {
          priority = 40;
        };
      };
      daemon.enable = true;
    };
    sops.secrets.harmonia-key = { };
    profiles.homelab.services.harmonia = {
      serviceName = "harmonia.cache";
      subdomain = "cache";
      port = 5000;
    };
  };
}
