{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sbcl
    rlwrap
  ];
}
