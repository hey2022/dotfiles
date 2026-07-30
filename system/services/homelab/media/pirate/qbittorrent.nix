{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.qbittorrent;
in
{
  config = lib.mkIf cfg.enable {
    services.qbittorrent = {
      group = "media";
      extraArgs = [
        "--confirm-legal-notice"
      ];
      webuiPort = 8123;
      torrentingPort = 49152;
      serverConfig = {
        BitTorrent.Session = {
          DefaultSavePath = "${config.profiles.homelab.media.mediaDir}/downloads";
        };
        Preferences.WebUI = {
          AlternativeUIEnabled = true;
          RootFolder = "${pkgs.vuetorrent}/share/vuetorrent";
          Password_PBKDF2 = "@ByteArray(XBmouOyHahIz2f4ScM/Plg==:PqXncxjC3/dmAqVkXY3Ga5rgATxmiBjN8xZxEPyuOoBpsK02CmaB2Kmuftbx3NpSrutCzBB0351xI9jJ3CGh/g==)";
        };
      };
    };
    systemd.services.qbittorrent.serviceConfig = {
      UMask = "002";
    };
    networking.firewall.allowedTCPPorts = [ cfg.torrentingPort ];
    profiles.homelab.services.qbittorrent = {
      port = cfg.webuiPort;
    };
  };
}
