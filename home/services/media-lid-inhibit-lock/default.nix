{
  config,
  lib,
  pkgs,
  ...
}:

let
  name = "media-lid-inhibit-lock";
in
{
  systemd.user.services.${name} = {
    Unit = {
      Description = "Inhibit suspend on lid when media is playing.";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${
        pkgs.writeShellApplication {
          name = name;
          runtimeInputs = [
            pkgs.systemd
            pkgs.playerctl
          ];
          text = builtins.readFile ./${name}.sh;
        }
      }/bin/${name}";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };
}
