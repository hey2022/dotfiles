{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.niri;
in
{
  config = lib.mkIf cfg.enable {
    programs.niri = {
      configFile = config.lib.hm.mkFlakeSymlink ./config.kdl;
    };
    programs = {
      espanso-config.enable = true;
      foot.enable = true;
      rofi.enable = true;
      waybar.enable = true;
      wlogout.enable = true;
    };
    services = {
      cliphist.enable = true;
      hypridle.enable = true;
      hyprpolkitagent.enable = true;
      swaync.enable = true;
      wlsunset.enable = true;
    };
    home.packages = with pkgs; [ thunar ];
  };
}
