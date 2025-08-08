{
  config,
  lib,
  ...
}:
{
  services.tlp = lib.mkIf config.host.laptop {
    enable = true;
    settings = {
      # https://linrunner.de/tlp/support/optimizing.html
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      PLATFORM_PROFILE_ON_AC = "performance";

      # https://linrunner.de/tlp/settings/battery.html
      START_CHARGE_THRESH_BAT0 = 90;
      STOP_CHARGE_THRESH_BAT0 = 95;
    };
  };
}
