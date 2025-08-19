{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../modules/nixos
    ./auto-upgrade.nix
    ./bluetooth.nix
    ./boot
    ./dev
    ./flatpak.nix
    ./groups.nix
    ./hardware
    ./network
    ./nix-ld.nix
    ./nix.nix
    ./power
    ./profiles
    ./programs
    ./security
    ./services
    ./shell
    ./sops-nix.nix
    ./ssh.nix
    ./virtualisation
    inputs.nix-topology.nixosModules.default
  ];
  options = {
    host = {
      laptop = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether the host is a laptop";
      };
      address = lib.mkOption {
        type = lib.types.str;
        default = "${config.networking.hostName}.taila6842.ts.net";
        description = "Host address";
      };
      desktop = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Whether the host is a desktop";
      };
    };
  };
  config = {
    system.stateVersion = "25.05";
    _module.args.pkgs-stable = import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      inherit (config.nixpkgs) config;
    };
  };
}
