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
          "7" = "dark";
          "9" = "dim";
          "11" = "normal";
          "13" = "bright";
          "16" = "normal";
          "18" = "dark";
          "20" = "night";
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
