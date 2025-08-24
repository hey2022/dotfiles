{
  inputs,
  config,
  lib,
  ...
}:

{
  imports = [ inputs.buildbot-nix.nixosModules.buildbot-master ];
  config = lib.mkIf config.services.buildbot-nix.master.enable {
    services.buildbot-nix.master = {
      useHTTPS = true;
      domain = "buildbot.${config.host.address}";
      workersFile = config.sops.secrets."buildbot/workers".path;
      admins = [ "hey2022" ];
      github = {
        authType.app = {
          id = 1689378;
          secretKeyFile = config.sops.secrets."buildbot/secretKey".path;
        };
        webhookSecretFile = config.sops.secrets."buildbot/webhookSecret".path;
        oauthId = "Iv23liAuWHy8Mdqf2Ifm";
        oauthSecretFile = config.sops.secrets."buildbot/oauthSecret".path;
        topic = "buildbot-hey2022";
      };
    };
    homelab.services.buildbot = {
      port = 8010;
      serviceName = "buildbot-nix.master";
    };
    sops = {
      secrets = {
        "buildbot/workers" = { };
        "buildbot/secretKey" = { };
        "buildbot/webhookSecret" = { };
        "buildbot/oauthSecret" = { };
      };
    };
  };
}
