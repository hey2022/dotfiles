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
    (pkgs.fetchpatch2 {
      url = "https://patch-diff.githubusercontent.com/raw/NixOS/nixpkgs/pull/507286.patch";
      hash = "sha256-jBJOiAP0T9lfLqeVF+WZai+xCI/26DO/otMrG6DORyU=";
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
    overlays = [
      (_final: _prev: builtins.mapAttrs (_: package: package) self.packages.${system})
    ];
  };
  nixosSystem = import (nixpkgs-patched + "/nixos/lib/eval-config.nix");
  home-manager = import home-manager-patched { };
}
