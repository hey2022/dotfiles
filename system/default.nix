{ ... }:

{
  imports = [
    ./network.nix
    ./bluetooth.nix
    ./nix-ld.nix
  ];
  nixpkgs.config.allowUnfree = true;
}
