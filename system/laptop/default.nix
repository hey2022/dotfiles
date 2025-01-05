{...}: {
  imports = [./auto-cpufreq.nix];
  powerManagement.enable = true;
}
