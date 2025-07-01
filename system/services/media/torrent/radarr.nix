{ config, ... }:
{
  services.radarr = {
    enable = true;
    group = "media";
  };
  services.caddy.virtualHosts."radarr.${config.host.address}".extraConfig = ''
    reverse_proxy localhost:7878
  '';
}
