{ ... }:
{
  imports = [
    ./caddy.nix
    ./glance.nix
    ./grafana.nix
    ./homepage
    ./karakeep.nix
    ./media
    ./miniflux.nix
    ./prometheus/prometheus.nix
  ];

  services = {
    qbittorrent.enable = true;
    suwayomi-server.enable = true;
  };
}
