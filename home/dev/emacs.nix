{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ emacs ];
  home.file = {
    ".config/doom" = {
      source = ../../.config/doom;
      recursive = true;
    };
  };
}
