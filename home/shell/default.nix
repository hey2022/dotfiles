{
  pkgs,
  ...
}:

{
  imports = [
    ./aliases.nix
    ./zoxide.nix
    ./nix-index.nix
    ./starship.nix
    ./env.nix
    ./fzf.nix
  ];

  home.packages = with pkgs; [
    eza
    bat
    fastfetch
    trash-cli
    ripgrep
    fd
  ];
}
