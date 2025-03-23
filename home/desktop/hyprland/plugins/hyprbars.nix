{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];
    settings = {
      plugin = {
        hyprbars = {
          bar_text_font = "Inter";
        };
      };
    };
  };
}
