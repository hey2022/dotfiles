{ self, inputs, ... }:

{
  perSystem =
    { system, ... }:
    let
      pkgs-patched = (import ../lib/patch { inherit self inputs system; }).nixpkgs;
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
        config = import "${self}/common/nixpkgs.nix";
      };
      pkgs-local = import ../pkgs {
        inherit inputs pkgs-stable;
        pkgs = pkgs-patched;
      };
    in
    {
      packages = pkgs-local;
    };
}
