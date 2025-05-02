{config, ...}: {
  services.prometheus.exporters.node = {
    enable = true;
    openFirewall = true;
    listenAddress = config.networking.hostName;
    enabledCollectors = ["systemd"];
  };
}
