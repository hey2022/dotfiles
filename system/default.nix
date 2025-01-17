{...}: {
  imports = [
    ./boot.nix
    ./programs
    ./nix.nix
    ./network
    ./bluetooth.nix
    ./nix-ld.nix
    ./ssh.nix
  ];
  system.stateVersion = "24.11";
}
