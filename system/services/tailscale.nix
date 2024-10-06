{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ../network.nix ];
  services.tailscale.enable = true;
}
