{ self, inputs, ... }:

{
  perSystem =
    { system, ... }:
    let
      pkgs-patched = (import ../lib/patch { inherit self inputs system; }).nixpkgs;
      pkgs-local = import ../pkgs {
        inherit inputs;
        pkgs = pkgs-patched;
      };
    in
    {
      packages = pkgs-local;
    };
}
