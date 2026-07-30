{
  inputs,
  config,
  lib,
  ...
}:

{
  config = lib.mkIf config.wayland.windowManager.hyprland.enable {
    wayland.windowManager.hyprland = {
      extraLuaFiles = {
        "split-monitor-workspaces.lua" = {
          content = config.lib.hm.mkFlakeSymlink ./split-monitor-workspaces.lua;
        };
      };
    };
    xdg.configFile."hypr/plugins/split-monitor-workspaces".source = inputs.split-monitor-workspaces;
  };
}
