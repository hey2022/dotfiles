{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.hypridle;
in
{
  config = lib.mkIf cfg.enable {
    services.hypridle = {
      settings = {
        general = {
          lock_cmd = "pgrep hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch 'hl.dsp.dpms({action=\"enable\"})' || niri msg action power-on-monitors";
        };

        listener = [
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 600;
            on-timeout = "hyprctl dispatch 'hl.dsp.dpms({action=\"disable\"})' || niri msg action power-off-monitors";
            on-resume = "hyprctl dispatch 'hl.dsp.dpms({action=\"enable\"})' || niri msg action power-on-monitors";
          }
          (lib.mkIf config.host.laptop {
            timeout = 900;
            on-timeout = "systemctl sleep";
          })
        ];
      };
    };
    programs.hyprlock.enable = true;
    systemd.user.services.autolock = {
      Unit = {
        Description = "Autolock session at startup";
        After = [ "hypridle.service" ];
        Requires = [ "hypridle.service" ];
      };
      Service = {
        Type = "oneshot";
        Environment = "XDG_RUNTIME_DIR=/run/user/%U";
        ExecStart = lib.getExe (
          pkgs.writeShellApplication {
            name = "lock-with-retry";
            runtimeInputs = [
              pkgs.systemd
              pkgs.coreutils
            ];
            text = ''
              SID=$(loginctl show-user "$USER" -p Display --value)
              for _ in {1..10}; do
                  loginctl lock-session "$SID"
                  LOCKED=$(loginctl show-session "$SID" -p LockedHint --value)
                  if [ "$LOCKED" = "yes" ]; then
                      exit 0
                  fi
                  sleep 0.1
              done
              exit 1
            '';
          }
        );
      };
      Install = {
        WantedBy = [ "hypridle.service" ];
      };
    };
  };
}
