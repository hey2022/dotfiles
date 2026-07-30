{ config, lib, ... }:

let
  cfg = config.services.suwayomi-server;
in
{
  config = lib.mkIf cfg.enable {
    services.suwayomi-server = {
      group = "media";
      settings.server = {
        port = 4567;
        basicAuthEnabled = true;
        basicAuthUsername = "admin";
        basicAuthPasswordFile = config.sops.secrets.suwayomi-password.path;
        localSourcePath = "${config.profiles.homelab.media.mediaDir}/manga";
        downloadsPath = "${config.profiles.homelab.media.mediaDir}/manga/suwayomi";
        autoDownloadNewChapters = true;
        extensionRepos = [
          "https://raw.githubusercontent.com/keiyoushi/extensions/repo/index.min.json"
        ];
      };
    };
    profiles.homelab.services.suwayomi = {
      inherit (cfg.settings.server) port;
      serviceName = "suwayomi-server";
    };
    sops.secrets.suwayomi-password = {
      owner = cfg.user;
    };
  };
}
