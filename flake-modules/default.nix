{ inputs, ... }:

{
  imports = [
    ./lib.nix
    ./pkgs.nix
    ./treefmt.nix
    inputs.home-manager.flakeModules.home-manager
  ];
}
