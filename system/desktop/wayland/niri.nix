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
    programs = {
      hyprlock.enable = true;
      ydotool.enable = true;
    };
    services.gnome.gnome-keyring.enable = false;
    environment.systemPackages = with pkgs; [
      labwc
      xwayland-satellite
    ];
  };
}
