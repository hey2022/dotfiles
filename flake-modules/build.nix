{
  self,
  inputs,
  ...
}:

{
  flake.lib.build =
    system:
    let
      pkgs = import inputs.nixpkgs { inherit system; };
      nixpkgs-patched = pkgs.applyPatches {
        name = "nixpkgs-patched";
        src = inputs.nixpkgs;
        patches = [
          (pkgs.fetchpatch2 {
            url = "https://github.com/NixOS/nixpkgs/pull/424156.patch";
            sha256 = "sha256-zgWWtMHlPGA6Ootu6LPa4nsWu+eJ5wTzW7nxdqS/Xb4=";
          })
        ];
      };
      home-manager-patched = pkgs.applyPatches {
        name = "home-manager-patched";
        src = inputs.home-manager;
        patches = [ ];
      };
    in
    rec {
      mkNixpkgs = import nixpkgs-patched {
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
          home-manager' = import home-manager-patched { };
        in
        home-manager'.lib.homeManagerConfiguration {
          inherit modules;
          pkgs = mkNixpkgs;
          extraSpecialArgs = { inherit inputs; };
        };
    };
}
