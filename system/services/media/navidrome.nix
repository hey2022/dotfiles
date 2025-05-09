{config, ...}: let
  cfg = config.services.navidrome;
in {
  services.navidrome = {
    enable = true;
    group = "media";
    settings = {
      MusicFolder = "/var/lib/media/music";
    };
  };
  services.caddy.virtualHosts."navidrome.${config.host.address}".extraConfig = ''
    reverse_proxy localhost:${toString cfg.settings.Port}
  '';
}
