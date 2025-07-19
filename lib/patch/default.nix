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
      url = "https://github.com/NixOS/nixpkgs/pull/424156.patch";
      sha256 = "sha256-h/3F2k+oOC663rmqoYOQWBkEzaIqeeHrB8lZGUFJdWc=";
    })
    # https://nixpk.gs/pr-tracker.html?pr=404337
    # ./cloudflared.patch

    # https://nixpk.gs/pr-tracker.html?pr=423662
    ./television.patch

    # https://nixpk.gs/pr-tracker.html?pr=425908
    (pkgs.fetchpatch2 {
      name = "beets: refresh failing tests list";
      url = "https://github.com/NixOS/nixpkgs/pull/425908.patch";
      sha256 = "sha256-yagS5/3S/HMWGHpyV2fNMTc4QWH92Dc+U+GVfox/Fsw=";
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
    config = import "${self}/common/nixpkgs.nix";
    overlays = [
      (_final: _prev: builtins.mapAttrs (_: package: package) self.packages.${system})
    ];
  };
  nixosSystem = import (nixpkgs-patched + "/nixos/lib/eval-config.nix");
  home-manager = import home-manager-patched { };
}
