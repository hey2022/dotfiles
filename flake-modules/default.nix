{ inputs, ... }:

{
  imports = [
    ./build.nix
    ./pkgs.nix
    ./treefmt.nix
    inputs.home-manager.flakeModules.home-manager
  ];
}
