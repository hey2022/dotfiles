{pkgs, ...}: {
  imports = [
    ./aliases.nix
    ./zoxide.nix
    ./starship.nix
    ./env.nix
    ./direnv.nix
    ./scripts
    ./fish
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
