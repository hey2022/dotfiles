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
    extraConfig = ''
      $accent = $mauve
      $accentAlpha = $mauveAlpha
      $font = Inter

      # GENERAL
      general {
        disable_loading_bar = true
        hide_cursor = true
      }

      # BACKGROUND
      background {
        monitor =
        path = screenshot
        blur_passes = 2
        color = $base
      }

      # TIME
      label {
        monitor =
        text = $TIME
        color = $text
        font_size = 90
        font_family = $font
        position = -30, 0
        halign = right
        valign = top
      }

      # DATE
      label {
        monitor =
        text = cmd[update:43200000] date +"%A, %d %B %Y"
        color = $text
        font_size = 25
        font_family = $font
        position = -30, -150
        halign = right
        valign = top
      }

      # FINGERPRINT
      {
        monitor = "";
        text = "$FPRINTPROMPT";
        color = "$text";
        font_size = 14;
        font_family = font;
        position = "0, -107";
        halign = "center";
        valign = "center";
      }

      # INPUT FIELD
      input-field {
        monitor =
        size = 300, 60
        outline_thickness = 4
        dots_size = 0.2
        dots_spacing = 0.2
        dots_center = true
        outer_color = $accent
        inner_color = $surface0
        font_color = $text
        fade_on_empty = false
        placeholder_text = <span foreground="##$textAlpha"><i>󰌾 Logged in as </i><span foreground="##$accentAlpha">$USER</span></span>
        hide_input = false
        check_color = $accent
        fail_color = $red
        fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
        capslock_color = $yellow
        position = 0, -47
        halign = center
        valign = center
      }
    '';
  };
  wayland.windowManager.sway.extraConfig = lib.mkIf config.wayland.windowManager.sway.enable (lib.mkAfter "bindsym $mod+shift+escape exec hyprlock");
}
