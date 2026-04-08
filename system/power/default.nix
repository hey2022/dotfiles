{ config, lib, ... }:

{
  imports = [
    ./tlp.nix
    ./logind.nix
  ];
  config = lib.mkIf config.host.laptop {
    powerManagement.enable = true;
    services.upower.enable = true;
  };
}
