{
  sops = {
    defaultSopsFile = ../../secrets/root/desktop/secrets.yaml;
    secrets = {
      homepage = {
        sopsFile = ../../secrets/root/desktop/homepage.env;
        format = "dotenv";
      };
      immich = {
        sopsFile = ../../secrets/root/desktop/immich.env;
        format = "dotenv";
      };
      "mihomo/controller-secret" = { };
    };
  };
}
