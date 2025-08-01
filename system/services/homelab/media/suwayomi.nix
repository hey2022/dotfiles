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
    settings.server = {
      port = 4567;
      basicAuthEnabled = true;
      basicAuthUsername = "admin";
      basicAuthPasswordFile = config.sops.secrets.suwayomi-password.path;
      localSourcePath = "${config.homelab.mediaDir}/manga";
      downloadsPath = "${config.homelab.mediaDir}/manga/suwayomi";
      autoDownloadNewChapters = true;
      extensionRepos = [
        "https://raw.githubusercontent.com/keiyoushi/extensions/repo/index.min.json"
      ];
    };
  };
  homelab.services.suwayomi = {
    inherit (cfg.settings.server) port;
  };
  systemd.tmpfiles.rules = [
    "d ${config.homelab.mediaDir}/manga 775 root media - -"
  ];
}
