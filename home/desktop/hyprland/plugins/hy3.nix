{
  config,
  lib,
  pkgs,
  pkgs-git,
  ...
}: {
  wayland.windowManager.hyprland = lib.mkIf config.wayland.windowManager.hyprland.hy3 {
    # HACK: https://nixpk.gs/pr-tracker.html?pr=408284
    plugins = [pkgs-git.hyprlandPlugins.hy3];
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
