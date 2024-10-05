{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    wayvnc.enable = lib.mkEnableOption "Enable wayvnc";
  };
  config = lib.mkIf config.wayvnc.enable {
    home.packages = with pkgs; [
      wayvnc
    ];
    systemd.user.services.wayvnc = {
      Unit = {
        Description = "Start wayvnc";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.wayvnc}/bin/wayvnc -r";
        Restart = "always";
        RestartSec = 5;
      };
    };
  };
}
