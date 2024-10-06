{ ... }:

{
  imports = [
    ./network.nix
    ./bluetooth.nix
    ./nix-ld.nix
  ];
  system.stateVersion = "23.05";
  nixpkgs.config.allowUnfree = true;
}
