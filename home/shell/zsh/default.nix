{ config, pkgs, ... }:

{
  imports = [
    ../aliases.nix
    ../nix-index.nix
  ];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initExtra = builtins.readFile ./.zshrc;
    envExtra = builtins.readFile ./.zshenv;
    history.ignoreDups = true;
  };

  home.packages = with pkgs; [
    eza
    ripgrep
    fd
    bat
    zoxide
    fastfetch
    trash-cli
  ];
}
