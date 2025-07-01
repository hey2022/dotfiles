{ pkgs, ... }:
{
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };
  networking.nftables.ruleset = ''
    define EXCLUDED_IPS = { 100.64.0.0/10 }
    define EXCLUDED_PORTS = { 80, 443 }

    table inet excludeTraffic {
      chain excludeOutgoing {
        type route hook output priority 0; policy accept;
        ip daddr $EXCLUDED_IPS ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
      }
      chain allowIncoming {
        type filter hook input priority -100; policy accept;
        tcp dport $EXCLUDED_PORTS ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
        ip saddr $EXCLUDED_IPS ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
      }
      chain allowOutgoing {
        type route hook output priority -100; policy accept;
        tcp sport $EXCLUDED_PORTS ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
      }
    }
  '';
}
