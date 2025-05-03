{...}: {
  imports = [
    ./ai
    ./glance.nix
    ./grafana.nix
    ./homepage
    ./karakeep.nix
    ./media
    ./miniflux.nix
    ./prometheus/prometheus.nix
  ];
}
