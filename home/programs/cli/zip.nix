{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zip
    unzip
    unrar
  ];
}
