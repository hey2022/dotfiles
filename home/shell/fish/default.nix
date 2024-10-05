{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ../. ];
  home.sessionVariables = {
    fish_greeting = "";
  };
  programs.fish = {
    enable = true;
    preferAbbrs = true;
  };
}
