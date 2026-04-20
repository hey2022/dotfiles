{
  imports = [
    ./autoUpgrade.nix
    ./espanso-config.nix
    ./niri.nix
    ./wayscriber.nix
  ];
  disabledModules = [ "services/home-manager-auto-upgrade.nix" ];
}
