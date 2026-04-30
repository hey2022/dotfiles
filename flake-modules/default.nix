{ inputs, ... }:

{
  imports = [
    ../pkgs
    ./build.nix
    ./check.nix
    ./git-hooks.nix
    ./nix-topology.nix
    ./treefmt.nix
    inputs.home-manager.flakeModules.home-manager
  ];
}
