{ config, ... }:
let
  cfg = config.services.karakeep;
in
{
  services.karakeep = {
    extraEnvironment = {
      PORT = "9000";
    };
  };
  profiles.homelab.services.karakeep = {
    port = cfg.extraEnvironment.PORT;
  };
}
