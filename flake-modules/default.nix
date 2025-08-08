{ inputs, ... }:

{
  imports = [
    ../pkgs
    ./build.nix
    ./check.nix
    ./nix-topology.nix
    ./treefmt.nix
    inputs.home-manager.flakeModules.home-manager
  ];
}
