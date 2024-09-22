{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ../home/desktop/blueman.nix ];
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;
}
