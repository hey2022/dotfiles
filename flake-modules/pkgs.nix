{ inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages.cliprust = pkgs.callPackage ../pkgs/cliprust { };
      packages.nixpkgs-patched = pkgs.applyPatches {
        name = "nixpkgs-patched";
        src = inputs.nixpkgs;
        patches = [ ];
      };
      packages.home-manager-patched = pkgs.applyPatches {
        name = "home-manager-patched";
        src = inputs.home-manager;
        patches = [ ];
      };
    };
}
