{
  config,
  lib,
  pkgs,
  ...
}:
let
  inhibitors = {
    "inhibit-lid-sleep" = "handle-lid-switch:sleep";
    "inhibit-idle" = "idle";
  };
  makeInhibitorModule = name: what: {
    home.packages = [
      (pkgs.writeShellApplication {
        name = "toggle-${name}";
        runtimeInputs = [
          pkgs.systemd
          pkgs.libnotify
        ];
        text = ''
          if systemctl --user is-active --quiet "${name}.service"; then
            systemctl --user stop "${name}.service"
            notify-send "Toggled ${name}.service" "${name}.service stopped"
          else
            systemctl --user start "${name}.service"
            notify-send "Toggled ${name}.service" "${name}.service started"
          fi
        '';
      })
    ];

    systemd.user.services.${name} = {
      Unit.Description = name;
      Service = {
        Type = "simple";
        ExecStart = "${lib.getExe' pkgs.systemd "systemd-inhibit"} --what=${what} --why='${name}' ${lib.getExe' pkgs.coreutils "sleep"} infinity";
      };
    };
  };
in
{
  config = lib.mkIf config.host.laptop (
    lib.mkMerge (lib.mapAttrsToList makeInhibitorModule inhibitors)
  );
}
