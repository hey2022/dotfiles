{
  inputs,
  pkgs,
  config,
  ...
}:

let
  plugin = inputs.hyprland-scroll-overview.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  wayland.windowManager.hyprland = {
    plugins = [
      (plugin.overrideAttrs {
        buildInputs = [ pkgs.hyprland ] ++ pkgs.hyprland.buildInputs ++ [ pkgs.lua5_4 ];
      })
    ];
    extraLuaFiles = {
      "scrolloverview.lua" = {
        content = config.lib.hm.mkFlakeSymlink ./scrolloverview.lua;
      };
    };
  };
}
