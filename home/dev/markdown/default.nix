{ pkgs, ... }:
{
  imports = [
    ./grip.nix
  ];
  home.packages = with pkgs; [
    marksman
    mdl
  ];
}
