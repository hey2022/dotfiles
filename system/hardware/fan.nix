{
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
}
