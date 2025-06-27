{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.services.dnscrypt-proxy2.enable {
    services.dnscrypt-proxy2 = {
      settings = {
        server_names = ["adguard-dns" "quad9-dnscrypt-ip4-filter-ecs-pri" "dns0"];
        forwarding_rules = builtins.toFile "forwarding-rules" ''
          neverssl.com $DHCP,$BOOTSTRAP
        '';
        blocked_names = {
          blocked_names_file = "${pkgs.stevenblack-blocklist}/hosts";
        };
      };
    };
    networking = {
      networkmanager.dns = "none";
      nameservers = [
        "127.0.0.1"
        "::1"
      ];
    };
  };
}
