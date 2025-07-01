{ config, ... }:
{
  services.sonarr = {
    enable = true;
    group = "media";
  };
  services.caddy.virtualHosts."sonarr.${config.host.address}".extraConfig = ''
    reverse_proxy localhost:8989
  '';
}
