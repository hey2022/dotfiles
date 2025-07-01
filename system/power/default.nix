{
  config,
  lib,
  ...
}:
{
  imports = [ ./tlp.nix ];
  config = lib.mkIf config.host.laptop {
    powerManagement.enable = true;
    services.thermald.enable = true;
    services.upower.enable = true;
  };
}
