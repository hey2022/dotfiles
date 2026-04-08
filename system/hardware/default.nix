{ pkgs, ... }:
{
  imports = [
    ./logitech.nix
    ./tablet.nix
    ./thinkpad.nix
    ./fan.nix
  ];
  environment.systemPackages = [ pkgs.lm_sensors ];
  services.fwupd.enable = true;
}
