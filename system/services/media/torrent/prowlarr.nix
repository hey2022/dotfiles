{config, ...}: {
  services.prowlarr = {
    enable = true;
  };
  services.caddy.virtualHosts."prowlarr.${config.host.address}".extraConfig = ''
    reverse_proxy localhost:9696
  '';
}
