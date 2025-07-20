{ config, pkgs, ... }:

{
  sops.secrets = {
    "cloudflared/credentials" = {
      sopsFile = ../../secrets/desktop/cloudflared/credentials.json;
      format = "json";
      key = "";
    };
    "cloudflared/cert" = {
      sopsFile = ../../secrets/desktop/cloudflared/cert.pem;
      format = "binary";
    };
  };
  services = {
    cloudflared = {
      enable = true;
      tunnels = {
        "5a36f895-2dc4-44f6-a1c4-77635d08471d" = {
          default = "http_status:404";
          credentialsFile = config.sops.secrets."cloudflared/credentials".path;
          certificateFile = config.sops.secrets."cloudflared/cert".path;
          ingress =
            let
              domain = config.host.address;
            in
            {
              ${domain} = {
                service = "https://localhost:443";
                originRequest = {
                  originServerName = domain;
                };
              };
              "*.${domain}" = {
                service = "https://localhost:443";
                originRequest = {
                  originServerName = "*.${domain}";
                };
              };
            };
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
