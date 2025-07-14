{ inputs, ... }:

{
  imports = [
    ./build.nix
    ./pkgs.nix
    ./treefmt.nix
    ./nix-topology.nix
    inputs.home-manager.flakeModules.home-manager
  ];
}
