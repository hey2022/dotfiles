{lib, ...}: {
  imports = [
    ./bluetooth.nix
    ./boot
    ./flatpak.nix
    ./hardware
    ./network
    ./nix-ld.nix
    ./nix.nix
    ./polkit.nix
    ./power
    ./programs
    ./services
    ./shell/fish.nix
    ./ssh.nix
  ];
  options = {
    host.laptop = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether the host is a laptop";
    };
  };
  config = {
    system.stateVersion = "24.11";
  };
}
