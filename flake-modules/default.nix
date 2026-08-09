{ inputs, ... }:

{
  imports = [
    ../pkgs
    ./build.nix
    ./check.nix
    ./git-hooks.nix
    ./nix-topology.nix
    ./nix-wrapper-modules
    ./treefmt.nix
    inputs.home-manager.flakeModules.home-manager
  ];
}
