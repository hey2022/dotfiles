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
      processesInfo = true;
      configFile = config.sops.templates."mihomo.yaml".path;
    };
    sops = {
      secrets = {
        "mihomo/controller-secret" = { };
        "mihomo/XSUS" = {
          sopsFile = "${inputs.self}/secrets/root/secrets.yaml";
        };
        "mihomo/backup" = {
          sopsFile = "${inputs.self}/secrets/root/secrets.yaml";
        };
      };
      templates."mihomo.yaml".content =
        lib.strings.replaceStrings
          [
            "{{controller-secret}}"
            "{{XSUS}}"
            "{{backup}}"
          ]
          [
            config.sops.placeholder."mihomo/controller-secret"
            config.sops.placeholder."mihomo/XSUS"
            config.sops.placeholder."mihomo/backup"
          ]
          (lib.readFile ./config.yaml);
    };
  };
}
