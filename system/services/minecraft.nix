{
  config,
  lib,
  ...
}:
{
  networking.firewall = lib.mkIf config.profiles.gaming.enable {
    allowedTCPPorts = [ 25565 ];
    allowedUDPPorts = [
      25565

      # voice chat
      24454
    ];
  };
}
