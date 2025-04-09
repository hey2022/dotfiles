{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    plugins = [pkgs.hyprlandPlugins.hyprbars];
    settings = {
      plugin = {
        hyprbars = {
          bar_text_font = "Inter";
        };
      };
    };
  };
}
