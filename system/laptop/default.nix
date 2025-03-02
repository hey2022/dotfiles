{...}: {
  imports = [./tlp.nix];
  powerManagement.enable = true;
  services.thermald.enable = true;
  services.upower.enable = true;
}
