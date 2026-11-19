{
  self,
  pkgs,
  inputs,
  system,
  ...
}:

let
  nixpkgs-patches = [
    # https://nixpk.gs/pr-tracker.html?pr=507286
    (pkgs.fetchpatch2 {
      url = "https://patch-diff.githubusercontent.com/raw/NixOS/nixpkgs/pull/507286.diff";
      hash = "sha256-rphIBU7EVR0nhyB8IL+8lldHzSob9lcexmW1H+jUVUw=";
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
        patches = home-manager-patches;
      }
    else
      inputs.home-manager;
in
{
  nixpkgs = import nixpkgs-patched {
    inherit system;
    config = import "${self}/common/nixpkgs.nix";
  };
  nixosSystem = import (nixpkgs-patched + "/nixos/lib/eval-config.nix");
  home-manager = import home-manager-patched { };
}
