{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
    ripgrep
    fd
    bat
  ];

  home.file = {
    ".zshenv".source = ../../.zshenv;
    ".zsh" = {
      source = ../../.config/zsh;
      recursive = true;
    };
  };
}
