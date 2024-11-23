{
  config,
  lib,
  ...
}:
with lib; let
  moduleName = "myNavidrome";
  cfg = config.services.${moduleName};
in {
  options = {
    services.${moduleName} = {
      enable = mkEnableOption "Enable Navidrome";
      MusicFolder = mkOption {
        type = types.str;
      };
    };
  };
  config = {
    services.navidrome = {
      enable = true;
      openFirewall = true;
      settings = {
        Address = "0.0.0.0";
        MusicFolder = cfg.MusicFolder;
      };
    };
    systemd.services.navidrome.serviceConfig.ProtectHome = mkForce false;
  };
}
