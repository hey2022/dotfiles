{ config, pkgs, ... }:

{
  services = {
    cloudflared = {
      enable = true;
      tunnels = {
        "99843de1-f462-4f8c-bd97-e872f6c0137b" = {
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
