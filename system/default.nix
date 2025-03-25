{lib, ...}: {
  imports = [
    ./boot
    ./programs
    ./services
    ./nix.nix
    ./network
    ./bluetooth.nix
    ./nix-ld.nix
    ./ssh.nix
    ./polkit.nix
    ./shell/fish.nix
    ./power
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
