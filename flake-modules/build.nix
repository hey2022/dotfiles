{
  self,
  inputs,
  ...
}:

{
  flake.lib.build =
    system:
    let
      patched = import ../lib/patch {
        inherit self inputs system;
      };
    in
    {
      mkSystem =
        modules:
        patched.nixosSystem {
          inherit system modules;
          pkgs = patched.nixpkgs;
          specialArgs = { inherit inputs; };
        };
      mkHome =
        modules:
        patched.home-manager.lib.homeManagerConfiguration {
          inherit modules;
          pkgs = patched.nixpkgs;
          extraSpecialArgs = { inherit inputs; };
        };
    };
}
