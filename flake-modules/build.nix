{
  self,
  inputs,
  ...
}:

{
  flake.lib.build = system: rec {
    mkNixpkgs = import self.packages.${system}.nixpkgs-patched {
      inherit system;
      config = import ../common/nixpkgs.nix;
      overlays = [
        (_final: _prev: builtins.mapAttrs (_: package: package) self.packages.${system})
      ];
    };
    mkSystem =
      modules:
      inputs.nixpkgs.lib.nixosSystem {
        inherit system modules;
        pkgs = mkNixpkgs;
        specialArgs = { inherit inputs; };
      };
    mkHome =
      modules:
      let
        home-manager' = import self.packages.${system}.home-manager-patched { };
      in
      home-manager'.lib.homeManagerConfiguration {
        inherit modules;
        pkgs = mkNixpkgs;
        extraSpecialArgs = { inherit inputs; };
      };
  };
}
