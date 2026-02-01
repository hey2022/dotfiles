{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.lm_sensors ];
  services.thinkfan = {
    settings = {
      sensors = [
        {
          chip = "coretemp-isa-0000";
          ids = [
            "Package id 0"
            "Core 0"
            "Core 1"
            "Core 2"
            "Core 3"
          ];
        }
        {
          chip = "thinkpad-isa-0000";
          ids = [
            "CPU"
          ];
        }
        {
          chip = "acpitz-acpi-0";
          ids = [ "temp1" ];
        }
        {
          chip = "nvme-pci-0400";
          ids = [
            "Composite"
            "Sensor 1"
            "Sensor 2"
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
          85
        ]
        [
          "level disengaged"
          80
          255
        ]
      ];
    };
  };

}
