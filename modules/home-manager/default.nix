{
  imports = [
    ./niri.nix
    ./autoUpgrade.nix
  ];
  disabledModules = [ "services/home-manager-auto-upgrade.nix" ];
}
