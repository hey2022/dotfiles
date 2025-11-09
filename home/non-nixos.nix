{ config, ... }:

{
  targets.genericLinux.enable = !config.host.isNixOS;
}
