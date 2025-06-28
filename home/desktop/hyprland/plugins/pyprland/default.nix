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
      ];
    };
    xdg.configFile."hypr/pyprland.toml".source = config.lib.hm.mkFlakeSymlink ./pyprland.toml;
  };
}
