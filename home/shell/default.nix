{
  pkgs,
  ...
}:

{
  imports = [
    ./aliases.nix
    ./zoxide.nix
    ./starship.nix
    ./env.nix
    ./fzf.nix
    ./uutils.nix
  ];

  home.packages = with pkgs; [
    eza
    bat
    fastfetch
    trashy
    ripgrep-all
    tldr
    fd
  ];
}
