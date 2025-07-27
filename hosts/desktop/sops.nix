{
  sops = {
    defaultSopsFile = ../../secrets/desktop/secrets.yaml;
    secrets = {
      homepage = {
        sopsFile = ../../secrets/desktop/homepage.env;
        format = "dotenv";
      };
    };
  };
}
