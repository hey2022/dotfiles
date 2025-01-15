{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.wluma;
in {
  options.programs.wluma = {
    enable = mkEnableOption "Automatic brightness adjustment based on screen contents and ALS";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.wluma];
    services.udev.packages = [pkgs.wluma];
    systemd.packages = [pkgs.wluma];
  };
}
