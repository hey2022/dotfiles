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
      # Extend battery runtime
      # CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      # PLATFORM_PROFILE_ON_BAT = "low-power";
      # CPU_BOOST_ON_BAT = 0;
      # CPU_BOOST_ON_SAV = 0;
      # CPU_HWP_DYN_BOOST_ON_BAT = 0;
      # CPU_HWP_DYN_BOOST_ON_SAV = 0;
      # AMDGPU_ABM_LEVEL_ON_BAT = 3;

      # Improve performance on AC power
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      # https://linrunner.de/tlp/settings/battery.html
      START_CHARGE_THRESH_BAT0 = 90;
      STOP_CHARGE_THRESH_BAT0 = 95;
    };
  };
}
