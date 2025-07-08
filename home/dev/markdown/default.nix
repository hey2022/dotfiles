{ pkgs, ... }:
{
  home.packages = with pkgs; [
    go-grip
    marksman
    mdl
  ];
}
