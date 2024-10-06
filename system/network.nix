{
  config,
  lib,
  pkgs,
  ...
}:

{
  networking.nameservers = [ "9.9.9.9" ];
  services.resolved = {
    enable = true;
    dnsovertls = "true";
    dnssec = "true";
  };
}
