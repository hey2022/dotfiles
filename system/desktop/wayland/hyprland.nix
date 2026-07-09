{ config, lib, ... }:

let
  cfg = config.programs.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    programs = {
      hyprland = {
        withUWSM = true;
      };
      hyprlock.enable = true;
      ydotool.enable = true;
    };
    services = {
      espanso.enable = true;
    };
  };
}
