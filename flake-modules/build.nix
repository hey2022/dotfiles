{
  self,
  inputs,
  withSystem,
  ...
}:

let
  get-patched =
    system:
    import ../lib/patch {
      inherit self inputs system;
      pkgs = import inputs.nixpkgs { inherit system; };
    };
in
{
  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = (get-patched system).nixpkgs;
    };

  flake.lib.build =
    system:
    let
      patched = get-patched system;
    in
    withSystem system (
      { self', pkgs, ... }: {
        mkSystem =
          modules:
          patched.nixosSystem {
            inherit system modules pkgs;
            specialArgs = {
              inherit inputs self;
              pkgs-local = self'.packages;
            };
          };

        mkHome =
          modules:
          patched.home-manager.lib.homeManagerConfiguration {
            inherit modules pkgs;
            extraSpecialArgs = {
              inherit inputs self;
              pkgs-local = self'.packages;
            };
          };
      }
    );
}
