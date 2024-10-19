{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nh
    nix-search-cli
    nixd
    nixfmt-rfc-style
  ];
  home.sessionVariables = {
    FLAKE = "$HOME/.dotfiles";
  };
}
