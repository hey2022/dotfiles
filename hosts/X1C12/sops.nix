{
  sops = {
    defaultSopsFile = ../../secrets/root/X1C12/secrets.yaml;
    secrets = {
      "mihomo/controller-secret" = { };
    };
  };
}
