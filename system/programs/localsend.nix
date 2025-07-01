{ pkgs, ... }:
{
  programs.localsend = {
    enable = true;
    package = pkgs.emptyDirectory;
  };
}
