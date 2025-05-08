{
  config,
  pkgs,
  ...
}: {
  services.caddy = {
    enable = true;
    environmentFile = config.sops.secrets.caddy.path;
    package = pkgs.caddy.withPlugins {
      plugins = ["github.com/caddy-dns/duckdns@v0.5.0"];
      hash = "sha256-bRH4mIK1d5m1LCxDXNPyN/8jGvQA6nsvTThe6ApXIqM=";
    };
  };
  services.tailscale.permitCertUid = config.services.caddy.user;
  networking.firewall = {
    allowedTCPPorts = [80 443];
    allowedUDPPorts = [443];
  };
}
