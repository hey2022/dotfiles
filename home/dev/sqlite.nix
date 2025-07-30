{ pkgs, ... }:

{
  home.packages = with pkgs; [
    sqlitebrowser
  ];
}
