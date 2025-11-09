{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pkgs.goldendict-ng
    pyglossary-gui
  ];
}
