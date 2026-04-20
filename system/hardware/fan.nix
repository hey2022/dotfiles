{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.thinkfan;
in
{
  config = lib.mkIf cfg.enable {
    services.thinkfan = {
      settings = {
        sensors = [
          {
            chip = "coretemp-isa-0000";
            ids = [
              "Package id 0"
            ];
          }
        ];
        fans = [
          { tpacpi = "/proc/acpi/ibm/fan"; }
        ];
        levels = [
          [
            "level auto"
            0
            70
          ]
          [
            7
            65
            80
          ]
          [
            "level full-speed"
            75
            255
          ]
        ];
      };
    };
    systemd.services.thinkfan-sleep.serviceConfig.ExecStart = lib.mkForce [
      ""
      "${lib.getExe' pkgs.procps "pkill"} -x -pwr thinkfan"
      "${lib.getExe' pkgs.util-linux "logger"} -t '%N' \"Setting /proc/acpi/ibm/fan to 'level auto'\""
      "${pkgs.runtimeShell} -c 'echo \"level auto\" > /proc/acpi/ibm/fan'"
      "${lib.getExe' pkgs.coreutils "sleep"} 1"
    ];
  };
}
