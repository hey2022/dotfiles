{pkgs, ...}: {
  imports = [
    ./aliases.nix
    ./zoxide.nix
    ./starship.nix
    ./env.nix
    ./uutils.nix
    ./direnv.nix
    ./scripts
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
  ];
}
