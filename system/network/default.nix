{ pkgs, ... }:
{
  imports = [
    ./dns
    ./nm-applet.nix
    ./proxy
    ./wireshark.nix
  ];
  networking = {
    nftables = {
      enable = true;
      flushRuleset = true;
    };
    networkmanager.enable = true;
  };

  # HACK: https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online = {
    serviceConfig = {
      ExecStart = [
        ""
        "${pkgs.networkmanager}/bin/nm-online -q"
      ];
    };
  };

  boot = {
    kernelModules = [ "tcp_bbr" ];
    kernel.sysctl = {
      "net.core.default_qdisc" = "cake";
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.ipv4.tcp_ecn" = 1;
      "net.ipv4.tcp_fastopen" = 3;
    };
  };
}
