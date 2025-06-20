{config, ...}: let
  cfg = config.services.karakeep;
in {
  services.karakeep = {
    enable = true;
    extraEnvironment = {
      PORT = "9000";
    };
  };
  # TODO: Use karakeep option when this is merged https://nixpk.gs/pr-tracker.html?pr=418146
  services.meilisearch.dumplessUpgrade = true;
  services.caddy.virtualHosts."karakeep.${config.host.address}".extraConfig = ''
    reverse_proxy localhost:${toString cfg.extraEnvironment.PORT}
  '';
}
