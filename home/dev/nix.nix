{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nh
    nixfmt-rfc-style
  ];
  home.sessionVariables = {
    FLAKE = "$HOME/.dotfiles";
  };
}
