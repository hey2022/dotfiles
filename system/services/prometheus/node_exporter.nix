{config, ...}: let
  cfg = config.services.prometheus.exporters.node;
in {
  services.prometheus.exporters.node = {
    enable = true;
    openFirewall = true;
    listenAddress = "0.0.0.0";
    enabledCollectors = ["systemd"];

    firewallRules = ''
      iifname "tailscale0" tcp dport ${toString cfg.port} counter accept
    '';
  };
}
