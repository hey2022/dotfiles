{
  config,
  lib,
  ...
}:
let
  cfg = config.profiles.homelab.media;
in
{
  options = {
    profiles.homelab.media = {
      enable = lib.mkEnableOption "Media server setup";
      pirate.enable = lib.mkEnableOption "Pirating setup";
      mediaDir = lib.mkOption {
        description = "Path to media directory";
        type = lib.types.path;
        default = "/srv/media";
      };
    };
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      users.groups.media = { };
      services = {
        calibre-web.enable = true;
        immich.enable = true;
      };
    })
    (lib.mkIf cfg.pirate.enable {
      profiles.homelab.media.enable = true;
      services = {
        bazarr.enable = true;
        jellyfin.enable = true;
        lidarr.enable = true;
        prowlarr.enable = true;
        qbittorrent.enable = true;
        radarr.enable = true;
        seerr.enable = true;
        sonarr.enable = true;
        suwayomi-server.enable = false;
      };
    })
  ];
}
