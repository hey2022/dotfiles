{ ... }:

{
  networking = {
    networkmanager.dns = "none";
    nameservers = [
      "127.0.0.1"
      "::1"
    ];
    hosts = {
      "34.223.124.45" = [ "neverssl.com" ];
    };
  };
  services.dnscrypt-proxy2 = {
    enable = true;
  };
}
