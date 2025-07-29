{ config, lib, ... }:

{
  services.caddy = {
    enable = true;
    virtualHosts =
      let
        domain = config.host.address;
      in
      {
        "${domain}, www.${domain}".extraConfig = ''
          reverse_proxy localhost:${toString config.homelab.rootService}
        '';
        "*.${domain}".extraConfig = lib.concatLines (
          lib.mapAttrsToList (name: service: ''
            @${name} host ${service.subdomain}.${domain}
            reverse_proxy @${name} localhost:${toString service.port}
          '') (lib.filterAttrs (_: service: service.expose) config.homelab.services)
        );
      };
  };
  services.tailscale.permitCertUid = config.services.caddy.user;
  networking.firewall = {
    allowedTCPPorts = [
      80
      443
    ];
    allowedUDPPorts = [ 443 ];
  };
}
