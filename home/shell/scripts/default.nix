{ pkgs, ... }:

{
  imports = [
    ./link-to-file
    ./nightgrade
    ./nixpif
    ./swap
  ];
  home.packages = with pkgs; [ neovim-anywhere ];
}
