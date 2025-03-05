{
  config,
  lib,
  pkgs,
  ...
}: let
  name = "lid-inhibit-lock";
in {
  config = lib.mkIf config.host.laptop {
    home.packages = [
      (pkgs.writeShellApplication {
        name = "toggle-${name}";
        runtimeInputs = [pkgs.systemd pkgs.libnotify];
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
        Description = "Inhibit lid lock";
      };
      Service = {
        Type = "simple";
        ExecStart = ''${pkgs.systemd}/bin/systemd-inhibit --what=handle-lid-switch --why="Inhibit lid lock" ${pkgs.coreutils}/bin/sleep infinity'';
      };
    };
    wayland.windowManager.sway.extraConfig = lib.mkIf config.wayland.windowManager.sway.enable (lib.mkAfter "bindsym $mod+i exec toggle-${name}");
  };
}
