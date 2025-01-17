{...}: {
  imports = [
    ./boot.nix
    ./nix.nix
    ./network
    ./bluetooth.nix
    ./nix-ld.nix
    ./ssh.nix
  ];
  system.stateVersion = "24.11";
}
