{ pkgs, ... }:
{
  imports = [
    ./logitech.nix
    ./tablet.nix
    ./thinkpad.nix
  ];
  environment.systemPackages = [ pkgs.lm_sensors ];
}
