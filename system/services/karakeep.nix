{
  config,
  lib,
  ...
}: {
  services.karakeep = {
    enable = true;
    extraEnvironment = {
      PORT = "9000";
    };
  };
  networking.firewall = {
    allowedTCPPorts = [(lib.strings.toInt config.services.karakeep.extraEnvironment.PORT)];
  };
}
