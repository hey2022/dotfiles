{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    package =
      if config.home.isNixOS
      then pkgs.hyprlock
      else pkgs.emptyDirectory;
    settings = {
      general = {
        grace = 3;
        hide_cursor = true;
      };
      label = {
        text = "$TIME";
        color = "rgb(${config.lib.stylix.colors.base05})";
        shadow_color = "rgb(${config.lib.stylix.colors.base00})";
        shadow_passes = 1;
        shadow_size = 1;

        position = "0, 100";
        font_family = "Inter";
        font_size = 64;
        halign = "center";
        valign = "center";
      };
      background = {
        path = lib.mkForce "screenshot";
        blur_passes = 2;
      };
    };
  };
  wayland.windowManager.sway.extraConfig = lib.mkIf config.wayland.windowManager.sway.enable (lib.mkAfter "bindsym $mod+shift+escape exec hyprlock");
}
