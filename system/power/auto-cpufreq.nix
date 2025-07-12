_: {
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    charger = {
      governor = "performance";
      turbo = "auto";
    };
    battery = {
      governor = "powersave";
      turbo = "never";

      enable_thresholds = true;
      start_threshold = 75;
      stop_threshold = 80;
    };
  };
}
