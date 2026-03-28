{ config, lib, ... }:
let
  cfg = config.hardware.thinkpad;
in
{
  options = {
    hardware.thinkpad.enable = lib.mkEnableOption "thinkpad support";
  };
  config = lib.mkIf cfg.enable {
    # control fan speed through /proc/acpi/ibm/fan
    boot.extraModprobeConfig = "options thinkpad_acpi experimental=1 fan_control=1";
  };
}
