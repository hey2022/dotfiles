{ config, lib, ... }:

let
  cfg = config.services.cloudflared;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
    boot.kernel.sysctl = {
      "net.core.rmem_max" = 7500000;
      "net.core.wmem_max" = 7500000;
    };
  };
}
