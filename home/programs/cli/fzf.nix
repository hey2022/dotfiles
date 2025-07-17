{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fd
  ];
  programs.fzf = {
    defaultCommand = "fd -t f";
  };
}
