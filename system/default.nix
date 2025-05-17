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
    ./power
    ./profiles
    ./programs
    ./security
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
    host.address = lib.mkOption {
      type = lib.types.str;
      default = "${config.networking.hostName}.taila6842.ts.net";
      description = "Host address";
    };
    host.desktop = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether the host is a desktop";
    };
  };
  config = {
    system.stateVersion = "24.11";
  };
}
