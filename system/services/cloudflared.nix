{ config, lib, ... }:

let
  cfg = config.services.cloudflared;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };
}
