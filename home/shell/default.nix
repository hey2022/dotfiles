{ pkgs, ... }:
{
  imports = [
    ./aliases.nix
    ./direnv.nix
    ./env.nix
    ./fish
    ./pay-respects.nix
    ./scripts
    ./starship.nix
    ./zellij.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    bat
    btop
    choose
    duf
    dust
    eza
    fastfetch
    fd
    lnav
    parallel
    ripgrep
    ripgrep-all
    sd
    tealdeer
    trashy
    tree
  ];
}
