{ config, pkgs, ... }:

{
  sops.secrets = {
    cloudflared = { };
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
          tokenFile = config.sops.secrets.cloudflared.path;
        };
      };
    };
    caddy = {
      package = pkgs.caddy.withPlugins {
        plugins = [ "github.com/caddy-dns/cloudflare@v0.2.1" ];
        hash = "sha256-2D7dnG50CwtCho+U+iHmSj2w14zllQXPjmTHr6lJZ/A=";
      };
      environmentFile = config.sops.secrets.caddy.path;
      globalConfig = ''
        acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}
      '';
    };
  };
}
