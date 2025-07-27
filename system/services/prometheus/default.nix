{ config, ... }:

let
  cfg = config.services.prometheus;
in
{
  imports = [
    ./node_exporter.nix
  ];
  homelab.services.prometheus = {
    inherit (cfg) port;
  };
}
