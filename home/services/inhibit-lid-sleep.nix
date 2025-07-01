{
  config,
  lib,
  pkgs,
  ...
}:
let
  name = "inhibit-lid-sleep";
in
{
  config = lib.mkIf config.host.laptop {
    home.packages = [
      (pkgs.writeShellApplication {
        name = "toggle-${name}";
        runtimeInputs = [
          pkgs.systemd
          pkgs.libnotify
        ];
        text = ''
          if systemctl --user is-active --quiet ${name}.service; then
            systemctl --user stop ${name}.service
            notify-send "Toggled ${name}.service" "${name}.service stopped"
          else
            systemctl --user start ${name}.service
            notify-send "Toggled ${name}.service" "${name}.service started"
          fi
        '';
      })
    ];
    systemd.user.services.${name} = {
      Unit = {
        Description = "Inhibit lid sleep";
      };
      Service = {
        Type = "simple";
        ExecStart = ''${lib.getExe' pkgs.systemd "systemd-inhibit"} --what=handle-lid-switch:sleep --why="Inhibit lid sleep" ${lib.getExe' pkgs.coreutils "sleep"} infinity'';
      };
    };
    wayland.windowManager = {
      hyprland.settings.bind = [ "$mod, I, exec, toggle-${name}" ];
      sway.extraConfig = lib.mkAfter "bindsym $mod+i exec toggle-${name}";
    };
  };
}
