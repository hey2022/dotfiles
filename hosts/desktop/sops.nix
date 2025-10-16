{
  sops = {
    defaultSopsFile = ../../secrets/root/desktop/secrets.yaml;
    secrets = {
      homepage = {
        sopsFile = ../../secrets/root/desktop/homepage.env;
        format = "dotenv";
      };
    };
  };
}
