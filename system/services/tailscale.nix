{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.resolved.enable = true;
  services.tailscale.enable = true;
}
