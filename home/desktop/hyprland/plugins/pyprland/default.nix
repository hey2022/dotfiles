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
    };
    xdg.configFile."hypr/pyprland.toml".source = config.lib.hm.mkFlakeSymlink ./pyprland.toml;
  };
}
