{ pkgs, ... }:

{
  imports = [
    ./ap-dl
    ./link-to-file
    ./nightgrade
    ./nixpif
    ./swap
    ./zjs
  ];
  home.packages = with pkgs; [ neovim-anywhere ];
}
