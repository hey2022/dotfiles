{...}: {
  imports = [
    ./ai
    ./glance.nix
    ./grafana.nix
    ./karakeep.nix
    ./media
    ./miniflux.nix
    ./prometheus/prometheus.nix
  ];
}
