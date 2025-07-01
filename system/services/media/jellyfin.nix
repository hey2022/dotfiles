{ config, ... }:
{
  services.jellyfin = {
    enable = true;
    group = "media";
  };
  services.caddy.virtualHosts."jellyfin.${config.host.address}".extraConfig = ''
    reverse_proxy localhost:8096
  '';
}
