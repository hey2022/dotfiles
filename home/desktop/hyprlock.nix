{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    package =
      if builtins.pathExists "/etc/NIXOS"
      then pkgs.hyprlock
      else pkgs.emptyDirectory;
    settings = {
      general = {
        grace = 3;
        hide_cursor = true;
      };
      label = {
        text = "$TIME";
        color = "rgb(${config.lib.stylix.colors.base00})";

        position = "0, 80";
        font_family = "Inter";
        font_size = 64;
        halign = "center";
        valign = "center";
      };
      background = {
        blur_passes = 2;
      };
    };
  };
  wayland.windowManager.sway.extraConfig = lib.mkIf config.wayland.windowManager.sway.enable (lib.mkAfter "bindsym $mod+shift+escape exec hyprlock");
}
