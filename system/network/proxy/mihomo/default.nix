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
      };
      templates."mihomo.yaml".content =
        lib.strings.replaceStrings
          [
            "{{controller-secret}}"
            "{{XSUS}}"
          ]
          [
            config.sops.placeholder."mihomo/controller-secret"
            config.sops.placeholder."mihomo/XSUS"
          ]
          (lib.readFile ./config.yaml);
    };
  };
}
