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
    # https://nixpk.gs/pr-tracker.html?pr=400589
    (pkgs.fetchpatch2 {
      name = "suwayomi-server: 1.1.1 -> 2.0.1727";
      url = "https://github.com/NixOS/nixpkgs/pull/400589.patch";
      sha256 = "sha256-ur8eyCzCUhBRmdSm4oQjOk6MyozjewjyH9durUhzmag=";
    })
    # https://nixpk.gs/pr-tracker.html?pr=431873
    (pkgs.fetchpatch2 {
      name = "gitbutler: 0.14.19 -> 0.15.10";
      url = "https://github.com/NixOS/nixpkgs/pull/431873.patch";
      sha256 = "sha256-AywgW3znfmidsMkdzqwKuKVeSgTwklPAOVo08h3ejjQ=";
    })
    # https://nixpk.gs/pr-tracker.html?pr=442277
    (pkgs.fetchpatch2 {
      name = "searxng: 0-unstable-2025-08-29 -> 0-unstable-2025-09-11, relax typer-slim";
      url = "https://github.com/NixOS/nixpkgs/pull/442277.patch";
      sha256 = "sha256-61+K3yIoioeoDq2fnvGVqI8yhLEdVXR/i+e7uYnCEkQ=";
    })
    # https://nixpk.gs/pr-tracker.html?pr=442302
    (pkgs.fetchpatch2 {
      name = "tigervnc: fix build failed";
      url = "https://github.com/NixOS/nixpkgs/pull/442302.patch";
      sha256 = "sha256-lbrDxXnBUTuRoE6THIzl+xSVrsi1GebK5DXom8MiFGk=";
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
