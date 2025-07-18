{ config, lib, ... }:

{
  services.caddy = {
    enable = true;
    virtualHosts = lib.mapAttrs' (
      name: port:
      lib.nameValuePair "${name}.${config.host.address}" {
        extraConfig = ''
          reverse_proxy localhost:${toString port}
        '';
      }
    ) config.hostedServices;
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
