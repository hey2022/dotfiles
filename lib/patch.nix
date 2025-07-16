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
      name = "gitbutler: 0.14.19 -> 0.15.2";
      url = "https://github.com/NixOS/nixpkgs/pull/424156.diff";
      sha256 = "sha256-eHVynJDZWnaNKakkq1MkdIAr1pxCcMxIW15KGzqNJgo=";
    })
    # https://nixpk.gs/pr-tracker.html?pr=425299
    (pkgs.fetchpatch2 {
      name = "clisp: fix broken symlinks";
      url = "https://github.com/NixOS/nixpkgs/pull/425299.patch";
      sha256 = "sha256-eixt+0nHxoRMMj+Js/wy8E/PWC41L9kgUAasAGH6Ua4=";
    })
    # https://nixpk.gs/pr-tracker.html?pr=425710
    (pkgs.fetchpatch2 {
      name = "gimp: fix build with gettext 0.25";
      url = "https://github.com/NixOS/nixpkgs/pull/425710.patch";
      sha256 = "sha256-KfDo2EABueN2QQVCdQvk2gQV4bgB+LJV3oULqTe05Oo=";
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
