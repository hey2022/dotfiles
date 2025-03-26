{pkgs, ...}: {
  imports = [
    ./aliases.nix
    ./zoxide.nix
    ./starship.nix
    ./env.nix
    ./direnv.nix
    ./scripts
    ./fish
    ./zellij.nix
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
    tldr
    trashy
    tree
  ];
}
