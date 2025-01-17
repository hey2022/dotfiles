{...}: {
  imports = [
    ./boot.nix
    ./programs
    ./services
    ./nix.nix
    ./network
    ./bluetooth.nix
    ./nix-ld.nix
    ./ssh.nix
    ./polkit.nix
    ./shell/fish.nix
  ];
  system.stateVersion = "24.11";
}
