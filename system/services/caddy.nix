{ config, lib, ... }:

{
  services.caddy = {
    enable = true;
    virtualHosts = lib.mapAttrs' (
      name: value:
      let
        serviceConfig = if lib.isInt value || lib.isString value then { port = value; } else value;
        hostname =
          if serviceConfig.root or false then config.host.address else "${name}.${config.host.address}";
      in
      lib.nameValuePair hostname {
        extraConfig = ''
          reverse_proxy localhost:${toString serviceConfig.port}
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
