{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.profiles.gaming.minecraft = {
    enable = lib.mkEnableOption "Minecraft gaming support";
  };
  config = lib.mkIf (config.profiles.gaming.enable && config.profiles.gaming.minecraft.enable) {
    home.packages = with pkgs; [
      cubiomes-viewer
    ];
  };
}
