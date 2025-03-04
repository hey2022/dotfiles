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
        "easeOutQuint,0.23,1,0.32,1"
        "easeInOutCubic,0.65,0.05,0.36,1"
        "linear,0,0,1,1"
        "almostLinear,0.5,0.5,0.75,1.0"
        "quick,0.15,0,0.1,1"
      ];

      animation = [
        "global, 1, 10, default"
        "border, 1, 5.39, easeOutQuint"
        "windows, 1, 4.79, easeOutQuint"
        "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        "windowsOut, 1, 1.49, linear, popin 87%"
        "fadeIn, 1, 1.73, almostLinear"
        "fadeOut, 1, 1.46, almostLinear"
        "fade, 1, 3.03, quick"
        "layers, 1, 3.81, easeOutQuint"
        "layersIn, 1, 4, easeOutQuint, fade"
        "layersOut, 1, 1.5, linear, fade"
        "fadeLayersIn, 1, 1.79, almostLinear"
        "fadeLayersOut, 1, 1.39, almostLinear"
        "workspaces, 1, 1.94, almostLinear, fade"
        "workspacesIn, 1, 1.21, almostLinear, fade"
        "workspacesOut, 1, 1.94, almostLinear, fade"
      ];
    };

    master = {
      new_status = "slave";
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
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
