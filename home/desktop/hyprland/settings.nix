{...}: {
  wayland.windowManager.hyprland.settings = {
    monitor = [",preferred,auto,1"];

    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;

      resize_on_border = true;
      allow_tearing = true;
      layout = "master";
    };

    decoration = {
      rounding = 10;
      rounding_power = 2;

      active_opacity = 1.0;
      inactive_opacity = 1.0;

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };

      blur = {
        enabled = true;
        size = 3;
        passes = 1;

        vibrancy = 0.1696;
      };
    };

    animations = {
      enabled = true;
      bezier = [
        "overshot,0.05,0.9,0.1,1.05"
        "exit,0.9,-0.2,0.95,0.05"
      ];

      animation = [
        "windows, 1, 3, overshot, popin 70%"
        "windowsOut, 1, 3, exit, slide"
        "borderangle, 1, 7, default"
        "fade, 1, 8, default"
        "fadeSwitch, 1, 15, default"
        "fadeShadow, 1, 15, default"
        "fadeDim, 1, 15, default"
        "border, 1, 15, default"
        "workspaces, 1, 3, default, slidefade 100%"
        "specialWorkspace, 1, 3, default, slidefadevert -50%"
      ];
    };

    master = {
      new_status = "slave";
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      focus_on_activate = true;
    };

    binds = {
      hide_special_on_workspace_change = true;
    };

    input = {
      kb_layout = "us";

      follow_mouse = 1;
      sensitivity = 0;
      accel_profile = "flat";

      kb_options = "caps:escape";

      touchpad = {
        natural_scroll = true;
      };
    };

    device = [
      {
        name = "tpps/2-elan-trackpoint";
        sensitivity = 1.0;
      }
    ];

    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
    };
  };
}
