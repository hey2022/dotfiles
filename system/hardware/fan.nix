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
    # https://github.com/vmatare/thinkfan/issues/181#issuecomment-1356350908
    systemd.services.thinkfan-sleep = lib.mkIf cfg.enable {
      serviceConfig.ExecStart = lib.mkForce [
        "${lib.getExe' pkgs.procps "pkill"} -x -winch thinkfan"
        "${lib.getExe' pkgs.coreutils "sleep"} 1"
      ];
    };
  };
}
