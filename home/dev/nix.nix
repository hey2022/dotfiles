{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ nh ];
  home.sessionVariables = {
    FLAKE = "~/.dotfiles";
  };
}