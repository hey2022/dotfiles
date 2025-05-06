{...}: {
  sops.secrets.homepage = {
    sopsFile = ../../secrets/desktop/homepage.env;
    format = "dotenv";
  };
}
