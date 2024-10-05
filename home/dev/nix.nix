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
  home.sessionVariables = {
    FLAKE = "$HOME/.dotfiles";
  };
}
