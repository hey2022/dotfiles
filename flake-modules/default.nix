{ inputs, ... }:

{
  imports = [
    ./build.nix
    ./nix-topology.nix
    ./pkgs.nix
    ./treefmt.nix
    inputs.home-manager.flakeModules.home-manager
  ];
}
