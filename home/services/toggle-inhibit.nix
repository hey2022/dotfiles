{
  config,
  lib,
  pkgs,
  ...
}:
let
  inhibitors = {
    "inhibit-idle" = {
      what = "idle";
      emoji = "💤";
      label = "Idle";
    };
    "inhibit-lid-sleep" = {
      what = "handle-lid-switch:sleep";
      emoji = "💻";
      label = "Lid";
    };
  };

  makeInhibitorModule = name: cfg: {
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
            notify-send "${cfg.label} inhibitor stopped"
          else
            systemctl --user start "${name}.service"
            notify-send "${cfg.label} inhibitor started"
          fi
        '';
      })
    ];

    systemd.user.services.${name} = {
      Unit.Description = name;
      Service = {
        Type = "simple";
        ExecStart = "${lib.getExe' pkgs.systemd "systemd-inhibit"} --what=${cfg.what} --why='${name}' ${lib.getExe' pkgs.coreutils "sleep"} infinity";
      };
    };
  };

  inhibitor-status = pkgs.writeShellApplication {
    name = "inhibitor-status";
    runtimeInputs = [
      pkgs.systemd
      pkgs.jq
    ];
    text = ''
      text=""
      tooltip=""
      active_count=0

      ${lib.concatLines (
        lib.mapAttrsToList (name: cfg: ''
          if systemctl --user is-active --quiet "${name}.service"; then
            text="''${text}${cfg.emoji}"
            tooltip="''${tooltip}${cfg.label} inhibited, "
            active_count=$((active_count + 1))
          fi
        '') inhibitors
      )}

      tooltip="''${tooltip%, }"

      if [ "$active_count" -eq 0 ]; then
          jq -cn '{text: "⚪", alt: "inactive", tooltip: "No Inhibitors Active", class: "inactive"}'
      else
          jq -cn --arg txt "$text" --arg tip "$tooltip" '{text: $txt, alt: "active", tooltip: $tip, class: "active"}'
      fi
    '';
  };
in
{
  config = lib.mkIf config.host.laptop (
    lib.mkMerge (
      (lib.mapAttrsToList makeInhibitorModule inhibitors) ++ [ { home.packages = [ inhibitor-status ]; } ]
    )
  );
}
