{config, ...}: {
  imports = [./beets.nix];
  services.lidarr = {
    enable = true;
    group = "media";
  };
  services.caddy.virtualHosts."lidarr.${config.host.address}".extraConfig = ''
    reverse_proxy localhost:8686
  '';
}
