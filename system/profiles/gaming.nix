{
  config,
  lib,
  pkgs-local,
  ...
}:
{
  options.profiles.gaming = {
    enable = lib.mkEnableOption "Gaming support";
  };
  config = lib.mkIf config.profiles.gaming.enable {
    programs = {
      steam.enable = true;
      gamescope.enable = true;
      gamemode.enable = true;
    };
    services.uuplugin = {
      enable = true;
      package = pkgs-local.uuplugin;
    };
  };
}
