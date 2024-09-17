{
  config,
  lib,
  pkgs,
  ...
}:

{
  networking.resolvconf.enable = true;
  services.tailscale.enable = true;
}
