{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    emacs
    ripgrep
    fd
  ];
  home.file = {
    ".config/doom" = {
      source = ../../.config/doom;
      recursive = true;
    };
  };
}
