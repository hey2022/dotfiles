{
  sops = {
    defaultSopsFile = ../../secrets/desktop/secrets.yaml;
    secrets = {
      cloudflared = { };
      homepage = {
        sopsFile = ../../secrets/desktop/homepage.env;
        format = "dotenv";
      };
      caddy = {
        sopsFile = ../../secrets/desktop/caddy.env;
        format = "dotenv";
      };
    };
  };
}
