{ pkgs, ... }:
{
  imports = [
    ./logitech.nix
  ];
  environment.systemPackages = [ pkgs.lm_sensors ];
}
