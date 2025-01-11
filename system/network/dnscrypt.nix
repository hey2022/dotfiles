{pkgs, ...}: {
  networking = {
    networkmanager.dns = "none";
    nameservers = [
      "127.0.0.1"
      "::1"
    ];
  };
  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      server_names = ["mullvad-base-doh" "quad9-dnscrypt-ip6-filter-pri" "adguard-dns-ipv6" "cloudflare-security-ipv6" "dns0" "controld-block-malware-ad"];
      forwarding_rules = builtins.toFile "forwarding-rules" ''
        neverssl.com 192.168.1.1,$DHCP,$BOOTSTRAP
      '';
      blocked_names = {
        blocked_names_file = "${pkgs.stevenblack-blocklist}/hosts";
      };
    };
  };
}
