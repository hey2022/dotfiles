{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = lib.mkIf config.wayland.windowManager.hyprland.hy3 {
    plugins = [inputs.hy3.packages.${pkgs.system}.hy3];
    settings = {
      general = {
        layout = lib.mkForce "hy3";
      };
      plugin.hy3 = {
        autotile = {
          enable = true;
        };
        tabs = {
          text_font = "Inter";
        };
      };
    };
  };
}
