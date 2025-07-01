{ config, ... }:
{
  hardware.logitech.wireless = {
    enable = config.host.desktop;
    enableGraphical = true;
  };
}
