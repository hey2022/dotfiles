{ config, pkgs, ... }:

{
  imports = [ ./nix-index.nix ];
  home.packages = with pkgs; [
    eza
    ripgrep
    fd
    bat
    zoxide
    fastfetch
    trash-cli
  ];

  home.file = {
    ".zshenv".source = ../../.zshenv;
    ".zsh" = {
      source = ../../.config/zsh;
      recursive = true;
    };
  };
}
