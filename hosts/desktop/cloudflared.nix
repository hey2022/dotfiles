{ config, pkgs, ... }:

{
  sops.secrets = {
    cloudflared = {
      sopsFile = ../../secrets/desktop/cloudflared.env;
      format = "dotenv";
    };
    caddy = {
      sopsFile = ../../secrets/desktop/caddy.env;
      format = "dotenv";
    };
  };
  services = {
    cloudflared = {
      enable = true;
      tunnels = {
        "5a36f895-2dc4-44f6-a1c4-77635d08471d" = {
          default = "http_status:404";
          environmentFile = config.sops.secrets.cloudflared.path;
        };
      };
    };
    caddy = {
      package = pkgs.caddy.withPlugins {
        plugins = [ "github.com/caddy-dns/cloudflare@v0.2.1" ];
        hash = "sha256-XwZ0Hkeh2FpQL/fInaSq+/3rCLmQRVvwBM0Y1G1FZNU=";
      };
      environmentFile = config.sops.secrets.caddy.path;
      globalConfig = ''
        acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}
      '';
    };
  };
}
