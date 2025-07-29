{
  inputs,
  config,
  lib,
  ...
}:

{
  imports = [ inputs.buildbot-nix.nixosModules.buildbot-worker ];
  config = lib.mkIf config.services.buildbot-nix.worker.enable {
    services.buildbot-nix.worker = {
      workerPasswordFile = config.sops.secrets."buildbot/workerPassword".path;
    };
    sops = {
      secrets = {
        "buildbot/workerPassword" = { };
      };
    };
  };
}
