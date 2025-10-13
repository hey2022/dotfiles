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
    programs.niri = { };
    services.gnome.gnome-keyring.enable = false;
    environment.systemPackages = with pkgs; [
      labwc
      xwayland-satellite
    ];
  };
}
