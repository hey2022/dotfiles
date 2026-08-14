{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.waypaper;
in
{
  options.programs.waypaper = {
    enable = lib.mkEnableOption "waypaper";
    random.enable = lib.mkEnableOption "waypaper random switcher";
  };
  config = lib.mkIf cfg.enable {
    services.awww.enable = true;
    home.packages = with pkgs; [
      waypaper
    ];
    systemd.user = lib.mkIf cfg.random.enable {
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
  };
}
