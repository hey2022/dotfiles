{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    programs = {
      hyprland = {
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage =
          inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
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
