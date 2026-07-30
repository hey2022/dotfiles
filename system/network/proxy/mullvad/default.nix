{ config, lib, ... }:

let
  cfg = config.services.mullvad-vpn;
in
{
  config = lib.mkIf cfg.enable {
    services.mullvad-vpn = {
      gui.enable = true;
    };
    networking.nftables.ruleset = lib.readFile ./mullvad-split-tunnel.rules;
  };
}
