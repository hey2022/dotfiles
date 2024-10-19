{
  config,
  lib,
  pkgs,
  ...
}:

{
  networking.nameservers = [
    "127.0.0.1"
    "::1"
  ];
  services.dnscrypt-proxy2 = {
    enable = true;
  };
}
