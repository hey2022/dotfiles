{ config, ... }:
let
  cfg = config.services.calibre-web;
in
{
  services.calibre-web = {
    group = "media";
    options = {
      enableBookUploading = true;
      calibreLibrary = "${config.homelab.mediaDir}/library";
    };
  };
  homelab.services.calibre-web = {
    inherit (cfg.listen) port;
  };
}
