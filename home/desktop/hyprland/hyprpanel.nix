{
  inputs,
  config,
  ...
}: let
  font-size = config.stylix.fonts.sizes.desktop;
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
          name = "LXGW WenKai";
          size = toString (font-size + 4);
        };
        bar = {
          transparent = true;
        };
        osd.enable = false;
      };
      menus = {
        dashboard = {
          powermenu.logout = "uwsm stop";
        };
        clock = {
          weather.enabled = false;
        };
      };
    };
  };
}
