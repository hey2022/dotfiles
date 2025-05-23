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
      hash = "sha256-ZdvxtHiJAyKIOVUAFns7WsfQddfO/fD1euyGFaBp9W8=";
    };
  };
  services.tailscale.permitCertUid = config.services.caddy.user;
  networking.firewall = {
    allowedTCPPorts = [80 443];
    allowedUDPPorts = [443];
  };
}
