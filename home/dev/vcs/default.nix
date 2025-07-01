{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./gitbutler.nix
    ./github.nix
    ./jujutsu.nix
  ];
  home.packages = with pkgs; [
    onefetch
  ];
}
