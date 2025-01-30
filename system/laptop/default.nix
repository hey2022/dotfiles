{...}: {
  imports = [./auto-cpufreq.nix];
  powerManagement.enable = true;
  services.thermald.enable = true;
}
