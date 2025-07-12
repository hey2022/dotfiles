{ pkgs, ... }:

let
  inherit (pkgs.nur.repos.rycee.firefox-addons) buildFirefoxXpiAddon;
  callPackage =
    path: args:
    pkgs.callPackage path (
      {
        inherit buildFirefoxXpiAddon;
      }
      // args
    );
in
{
  inherit buildFirefoxXpiAddon;
  bonjourr = callPackage ./bonjourr.nix { };
  zen-internet = callPackage ./zen-internet.nix { };
}
