{
  config,
  lib,
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
  };
}
