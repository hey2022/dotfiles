# TODO: create hm module
{
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    waypaper
  ];
  systemd.user = {
    services = {
      waypaper-random = {
        Unit = {
          Description = "Waypaper next random wallpaper";
        };
        Service = {
          Type = "oneshot";
          ExecStart = "${lib.getExe pkgs.waypaper} --random";
        };
      };
    };
    timers = {
      waypaper-wallpaper-cycle = {
        Unit.Description = "Waypaper random wallpaper cycle";
        Timer = {
          Unit = "waypaper-random.service";
          OnCalendar = "daily";
          Persistent = true;
        };
        Install.WantedBy = [ "timers.target" ];
      };
    };
  };
}
