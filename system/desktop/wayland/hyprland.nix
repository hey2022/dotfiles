{ config, lib, ... }:

let
  cfg = config.programs.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    programs = {
      hyprland = {
        xwayland.enable = true;
        withUWSM = true;
      };
      hyprlock.enable = true;
      ydotool.enable = true;
    };
  };
}
