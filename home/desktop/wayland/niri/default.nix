{ config, lib, ... }:

let
  cfg = config.programs.niri;
in
{
  config = lib.mkIf cfg.enable {
    programs.niri = {
      configFile = config.lib.hm.mkFlakeSymlink ./config.kdl;
    };
    programs = {
      rofi.enable = true;
      ghostty.enable = true;
      hyprlock.enable = true;
      waybar.enable = true;
      wlogout.enable = true;
    };
    services = {
      cliphist.enable = true;
      gammastep.enable = true;
      hypridle.enable = true;
      swaync.enable = true;
    };
  };
}
