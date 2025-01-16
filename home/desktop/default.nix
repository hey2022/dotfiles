{pkgs, ...}: {
  imports = [./icons.nix ../../modules/stylix.nix ./wluma.nix];
  home.packages = with pkgs; [
    desktop-file-utils
  ];
  services.wluma = {
    enable = true;
    settings = {
      als.time = {
        thresholds = {
          "0" = "night";
          "7" = "dim";
          "8" = "normal";
          "11" = "bright";
          "13" = "normal";
          "18" = "dim";
          "21" = "dark";
          "23" = "night";
        };
      };

      output.backlight = [
        {
          name = "eDP-1";
          path = "/sys/class/backlight/intel_backlight";
          capturer = "wayland";
        }
      ];

      keyboard = [
        {
          name = "keyboard-thinkpad";
          path = "/sys/bus/platform/devices/thinkpad_acpi/leds/tpacpi::kbd_backlight";
        }
      ];
    };
  };
}
