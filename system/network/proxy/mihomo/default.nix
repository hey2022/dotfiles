{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.mihomo;
in
{
  config = lib.mkIf cfg.enable {
    services.mihomo = {
      tunMode = true;
      webui = pkgs.metacubexd;
      # processes Info = true;
      configFile = config.sops.templates."mihomo.yaml".path;
    };
    sops = {
      secrets = {
        "mihomo/controller-secret" = { };
        "mihomo/XSUS" = {
          sopsFile = "${inputs.self}/secrets/root/secrets.yaml";
        };
        "mihomo/KyCloud" = {
          sopsFile = "${inputs.self}/secrets/root/secrets.yaml";
        };
      };
      templates."mihomo.yaml".content =
        lib.strings.replaceStrings
          [
            "{{controller-secret}}"
            "{{XSUS}}"
            "{{KyCloud}}"
          ]
          [
            config.sops.placeholder."mihomo/controller-secret"
            config.sops.placeholder."mihomo/XSUS"
            config.sops.placeholder."mihomo/KyCloud"
          ]
          (lib.readFile ./config.yaml);
    };
  };
}
