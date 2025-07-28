{ config, ... }:

let
  cfg = config.services.suwayomi-server;
in
{
  sops.secrets.suwayomi-password = {
    owner = cfg.user;
  };
  services.suwayomi-server = {
    group = "media";
    dataDir = "${config.homelab.mediaDir}/manga";
    settings.server = {
      basicAuthEnabled = true;
      basicAuthUsername = "admin";
      basicAuthPasswordFile = config.sops.secrets.suwayomi-password.path;
      port = 4567;
    };
  };
  homelab.services.suwayomi = {
    inherit (cfg.settings.server) port;
  };
  systemd.tmpfiles.rules = [
    "d ${config.homelab.mediaDir}/manga 775 root media - -"
  ];
}
