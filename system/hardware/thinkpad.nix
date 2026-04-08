{ config, lib, ... }:
let
  cfg = config.hardware.thinkpad;
in
{
  options = {
    hardware.thinkpad.enable = lib.mkEnableOption "thinkpad support";
  };
  config = lib.mkIf cfg.enable {
    services = {
      thinkfan.enable = true;
    };
  };
}
