{
  sops = {
    defaultSopsFile = ../../secrets/root/goon/secrets.yaml;
    secrets = {
      "mihomo/controller-secret" = { };
    };
  };
}
