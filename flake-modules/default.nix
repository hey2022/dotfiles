{ inputs, ... }:

{
  imports = [
    ./build.nix
    ./check.nix
    ./git-hooks.nix
    ./nix-topology.nix
    ./packages.nix
    ./treefmt.nix
    inputs.home-manager.flakeModules.home-manager
  ];
}
