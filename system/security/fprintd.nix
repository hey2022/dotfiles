{ config, lib, ... }:

{
  config = lib.mkIf config.services.fprintd.enable {
    security.pam.services =
      let
        serviceCfg = service: {
          rules.auth = {
            unix = {
              args = [ "nullok" ];
            };
            fprintd = {
              order = config.security.pam.services.${service}.rules.auth.unix.order + 10;
            };
          };
        };
      in
      lib.flip lib.genAttrs serviceCfg [
        "greetd"
        "hyprlock"
        "login"
        "polkit-1"
        "sudo"
      ];
  };
}
