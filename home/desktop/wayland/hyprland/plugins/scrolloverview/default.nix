# BUG: https://github.com/yayuuu/hyprland-scroll-overview/issues/35
{
  inputs,
  config,
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprland-scroll-overview.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    extraLuaFiles = {
      "scrolloverview.lua" = {
        content = config.lib.hm.mkFlakeSymlink ./scrolloverview.lua;
      };
    };
  };
}
