{ config, pkgs, ... }:

{
  imports = [
    ../.
  ];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initExtra = builtins.readFile ./.zshrc;
    envExtra = builtins.readFile ./.zshenv;
    history.ignoreDups = true;
  };
}
