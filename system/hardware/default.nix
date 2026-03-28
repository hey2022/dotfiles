{ pkgs, ... }:
{
  imports = [
    ./logitech.nix
    ./thinkpad.nix
  ];
  environment.systemPackages = [ pkgs.lm_sensors ];
}
