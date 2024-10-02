{
  config,
  lib,
  pkgs,
  ...
}:

{
  systemd.user.services.media-lid-inhibit-lock = {
    Unit = {
      Description = "Inhibit suspend on lid when media is playing.";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.writeShellScript "media-lid-inhibit-lock" (
        builtins.readFile ./media-lid-inhibit-lock.sh
      )}";
      Restart = "on-failure";
    };
  };
}
