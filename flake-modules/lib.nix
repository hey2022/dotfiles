{
  self,
  inputs,
  ...
}:

{
  flake.flake-utils = system: rec {
    mkNixpkgs = import (self.packages.${system}.nixpkgs-patched) {
      inherit system;
      config = import ../common/nixpkgs.nix;
      overlays = [
        (final: prev: builtins.mapAttrs (_: package: package) self.packages.${system})
      ];
    };
    mkNixosSystem =
      modules:
      inputs.nixpkgs.lib.nixosSystem {
        inherit system modules;
        pkgs = mkNixpkgs;
        specialArgs = { inherit inputs; };
      };
    mkHomeConfig =
      modules:
      let
        home-manager' = import (self.packages.${system}.home-manager-patched) { };
      in
      home-manager'.lib.homeManagerConfiguration {
        inherit modules;
        pkgs = mkNixpkgs;
        extraSpecialArgs = { inherit inputs; };
      };
  };
}
