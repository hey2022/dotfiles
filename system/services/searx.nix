{ config, lib, ... }:

{
  services.searx = {
    enable = true;
    environmentFile = config.sops.secrets.searx.path;
    settings = {
      server = {
        bind_address = "127.0.0.1";
        port = 8880;
      };
      engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
        # BUG: https://github.com/searxng/searxng/issues/5286
        "google".disabled = true;
        # BUG: Wikidata breaks all searches
        "wikidata".disabled = true;
      };
    };
  };

  sops.secrets.searx = {
    sopsFile = ../../secrets/root/searx.env;
    format = "dotenv";
  };
}
