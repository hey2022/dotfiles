{ inputs, pkgs, ... }:

let
  nixCats = import ../common/nvim { inherit inputs pkgs; };
  system = pkgs.stdenv.hostPlatform.system;
in
rec {
  default = nvim;
  nvim = nixCats.packages.${system}.nvim;
  nvim-wrapped = nixCats.packages.${system}.nvim-wrapped;
  nvim-min = nixCats.packages.${system}.nvim-min;
  ap-dl = pkgs.callPackage ./ap-dl { };
  apcap = pkgs.callPackage ./apcap { };
  cliprust = pkgs.callPackage ./cliprust { };
  neovim-anywhere = pkgs.callPackage ./neovim-anywhere {
    neovim = nvim;
  };
  ticktick-cracked = pkgs.callPackage ./ticktick-cracked { };
  keepassxc-snapshot = pkgs.callPackage ./keepassxc-snapshot { };
  uuplugin = pkgs.callPackage ./uuplugin { };
  reshade-steam-proton = pkgs.callPackage ./reshade-steam-proton { };
}
// (import ./anki { inherit (pkgs) callPackage; })
// (import ./firefox-addons { inherit pkgs; })
