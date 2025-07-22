{ pkgs, ... }:

{
  home.packages = with pkgs; [
    qt6Packages.qtdeclarative
  ];
}
