{
  config,
  lib,
  ...
}: {
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
    ./sops-nix.nix
    ./ssh.nix
    ./virtualisation
  ];
  options = {
    host.laptop = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether the host is a laptop";
    };
    host.ip = lib.mkOption {
      type = lib.types.string;
      default = "${config.networking.hostName}.taila6842.ts.net";
      description = "Host ip address";
    };
  };
  config = {
    system.stateVersion = "24.11";
  };
}
