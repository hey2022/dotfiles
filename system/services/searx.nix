{ config, lib, ... }:

{
  services.searx = {
    enable = true;
    environmentFile = config.sops.secrets.searx.path;
    settings = {
      server = {
        bind_address = "127.0.0.1";
        port = 8888;
      };
      engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
        "bing".disabled = false;
        "duckduckgo".disabled = true;
        "startpage".disabled = true;
      };
    };
  };

  sops.secrets.searx = {
    sopsFile = ../../secrets/searx.env;
    format = "dotenv";
  };
}
