{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nh
    nixd
    nixfmt-rfc-style
  ];
  programs.nix-index.enable = true;
  home.sessionVariables = {
    FLAKE = "$HOME/.dotfiles";
  };
}
