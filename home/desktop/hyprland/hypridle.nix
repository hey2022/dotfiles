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
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 600;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 900;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        (lib.mkIf config.host.laptop {
          timeout = 1800;
          on-timeout = "systemctl suspend";
        })
      ];
    };
  };
  programs.hyprlock.enable = true;
}
