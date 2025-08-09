{ pkgs, ... }:

{
  programs.jq = {
    enable = true;
  };
  home.packages = [ pkgs.yq ];
}
