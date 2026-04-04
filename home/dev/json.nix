{ pkgs, ... }:
{
  home.packages = with pkgs; [ prettier ];
}
