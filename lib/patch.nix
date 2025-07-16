{
  self,
  inputs,
  system,
  ...
}:

let
  pkgs = import inputs.nixpkgs {
    inherit system;
  };
  nixpkgs-patches = [
    # https://nixpk.gs/pr-tracker.html?pr=424156
    (pkgs.fetchpatch2 {
      url = "https://github.com/NixOS/nixpkgs/pull/424156.diff";
      sha256 = "sha256-eHVynJDZWnaNKakkq1MkdIAr1pxCcMxIW15KGzqNJgo=";
    })
    # https://nixpk.gs/pr-tracker.html?pr=425299
    (pkgs.fetchpatch2 {
      url = "https://github.com/NixOS/nixpkgs/pull/425299.patch";
      sha256 = "sha256-eixt+0nHxoRMMj+Js/wy8E/PWC41L9kgUAasAGH6Ua4=";
    })
  ];
  home-manager-patches = [ ];
  nixpkgs-patched =
    if nixpkgs-patches != [ ] then
      pkgs.applyPatches {
        name = "nixpkgs-patched";
        src = inputs.nixpkgs;
        patches = nixpkgs-patches;
      }
    else
      inputs.nixpkgs;
  home-manager-patched =
    if home-manager-patches != [ ] then
      pkgs.applyPatches {
        name = "home-manager-patched";
        src = inputs.home-manager;
        patches = [ ];
      }
    else
      inputs.home-manager;
in
{
  nixpkgs = import nixpkgs-patched {
    inherit system;
    config = import ../common/nixpkgs.nix;
    overlays = [
      (_final: _prev: builtins.mapAttrs (_: package: package) self.packages.${system})
    ];
  };
  home-manager = import home-manager-patched { };
}
