{ pkgs, ... }:
{
  imports = [
    ./aliases.nix
    ./direnv.nix
    ./env.nix
    ./fish
    ./nushell
    ./pay-respects.nix
    ./scripts
    ./starship.nix
    ./tldr.nix
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
    gtrash
    lnav
    parallel
    ripgrep
    ripgrep-all
    sd
    tree
  ];
}
