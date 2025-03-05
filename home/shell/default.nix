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
    eza
    btop
    bat
    fastfetch
    trashy
    ripgrep
    ripgrep-all
    tldr
    fd
    dust
    duf
    lnav
    tree
  ];
}
