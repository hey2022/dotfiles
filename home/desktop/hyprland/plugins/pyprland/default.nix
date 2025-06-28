{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.wayland.windowManager.hyprland.enable {
    home.packages = [pkgs.pyprland];
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "pypr"
      ];
      bind = [
        "$mod, B, exec, pypr fetch_client_menu"
        "$mod, F, exec, pypr layout_center toggle"
        "$mod, Z, exec, pypr zoom ++0.5"
        "$mod SHIFT, Z, exec, pypr zoom"
        "$mod SHIFT, TAB, exec, pypr toggle_special scratchpad"
      ];
    };
    xdg.configFile."hypr/pyprland.toml".source = config.lib.hm.mkFlakeSymlink ./pyprland.toml;
  };
}
