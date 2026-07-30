{ config, ... }:
let
  cfg = config.services.calibre-web;
in
{
  services.calibre-web = {
    group = "media";
    options = {
      enableBookUploading = true;
      calibreLibrary = "${config.profiles.homelab.mediaDir}/library";
    };
  };
  profiles.homelab.services.calibre-web = {
    inherit (cfg.listen) port;
  };
}
