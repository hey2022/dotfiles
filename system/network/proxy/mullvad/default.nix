{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.mullvad-vpn;
in
{
  config = lib.mkIf cfg.enable {
    services.mullvad-vpn = {
      package = pkgs.mullvad-vpn;
    };
    networking.nftables.ruleset = lib.readFile ./mullvad-split-tunnel.rules;
  };
}
