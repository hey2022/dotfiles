{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
    ripgrep
    fd
    bat
    zoxide
    fastfetch
  ];

  home.file = {
    ".zshenv".source = ../../.zshenv;
    ".zsh" = {
      source = ../../.config/zsh;
      recursive = true;
    };
  };
}