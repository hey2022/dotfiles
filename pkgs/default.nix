{ inputs, pkgs, ... }:

let
  nixCats = import ../common/nvim { inherit inputs; };
  system = pkgs.stdenv.hostPlatform.system;
in
{
  default = nixCats.packages.${system}.nvim;
  nvim = nixCats.packages.${system}.nvim;
  nnvim = nixCats.packages.${system}.nnvim;
  nvim-min = nixCats.packages.${system}.nvim-min;
  ap-dl = pkgs.callPackage ./ap-dl { };
  apcap = pkgs.callPackage ./apcap { };
  cliprust = pkgs.callPackage ./cliprust { };
  neovim-anywhere = pkgs.callPackage ./neovim-anywhere { };
  ticktick-cracked = pkgs.callPackage ./ticktick-cracked { };
  keepassxc-snapshot = pkgs.callPackage ./keepassxc-snapshot { };
  uuplugin = pkgs.callPackage ./uuplugin { };
}
// (import ./anki { inherit (pkgs) callPackage; })
