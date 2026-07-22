{ pkgs-local, ... }:

{
  imports = [
    ./link-to-file
    ./nightgrade
    ./nixpif
    ./swap
  ];
  home.packages = [ pkgs-local.neovim-anywhere ];
}
