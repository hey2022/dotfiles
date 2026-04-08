{
  imports = [
    ./autoUpgrade.nix
    ./niri.nix
    ./wayscriber.nix
  ];
  disabledModules = [ "services/home-manager-auto-upgrade.nix" ];
}
