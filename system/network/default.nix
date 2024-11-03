{...}: {
  imports = [./dnscrypt.nix];
  networking.networkmanager.enable = true;
}
