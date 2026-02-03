{
  config,
  lib,
  ...
}:
{
  services.hypridle = {
    settings = {
      general = {
        lock_cmd = "pgrep hyprlock || hyprlock --grace 3";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "niri msg action power-on-monitors || hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "niri msg action power-off-monitors || hyprctl dispatch dpms off";
          on-resume = "niri msg action power-on-monitors || hyprctl dispatch dpms on";
        }
        {
          timeout = 600;
          on-timeout = "loginctl lock-session";
        }
        (lib.mkIf config.host.laptop {
          timeout = 900;
          on-timeout = "systemctl suspend";
        })
      ];
    };
  };
  programs.hyprlock.enable = true;
}
