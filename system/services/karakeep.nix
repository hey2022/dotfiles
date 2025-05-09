{config, ...}: let
  cfg = config.services.karakeep;
in {
  services.karakeep = {
    enable = true;
    extraEnvironment = {
      PORT = "9000";
    };
  };
  services.caddy.virtualHosts."karakeep.${config.host.address}".extraConfig = ''
    reverse_proxy localhost:${toString cfg.extraEnvironment.PORT}
  '';
}
