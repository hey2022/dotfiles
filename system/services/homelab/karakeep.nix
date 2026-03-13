{ config, ... }:
let
  cfg = config.services.karakeep;
in
{
  services.karakeep = {
    enable = true;
    extraEnvironment = {
      PORT = "9000";
    };
  };
  homelab.services.karakeep = {
    port = cfg.extraEnvironment.PORT;
  };
}
