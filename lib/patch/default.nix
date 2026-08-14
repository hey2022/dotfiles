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
    inputs.anki-contanki-patch
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
