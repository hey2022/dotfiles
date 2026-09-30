{ inputs, ... }:

{
  imports = [
    ../../pkgs
    ./build.nix
    ./check.nix
    ./devshells.nix
    ./git-hooks.nix
    ./nix-topology.nix
    ./nix-wrapper-modules
    ./templates
    ./treefmt.nix
    inputs.home-manager.flakeModules.home-manager
  ];
}
