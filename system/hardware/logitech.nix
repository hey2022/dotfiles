{ config, lib, ... }:
{
  config = lib.mkIf config.host.desktop {
    hardware.logitech.wireless.enable = true;
    programs.solaar.enable = true;
  };
}
