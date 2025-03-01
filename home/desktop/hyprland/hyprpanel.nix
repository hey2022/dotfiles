{
  inputs,
  config,
  ...
}: let
  font = "${config.stylix.fonts.sansSerif.name}";
  font-size = "${toString config.stylix.fonts.sizes.desktop}";
in {
  imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];
  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    overwrite.enable = true;
    hyprland.enable = true;
    theme = "catppuccin_mocha";
    settings = {
      bar = {
        launcher.autoDetectIcon = true;
        workspaces = {
          show_numbered = true;
          ignored = "98";
        };
      };
      theme = {
        font = {
          name = font;
          size = font-size;
        };
      };
      menus = {
        clock = {
          weather.enabled = false;
        };
      };
    };
  };
}
