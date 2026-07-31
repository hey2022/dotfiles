{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    choose
    dua
    duf
    dust
    eza
    fastfetch
    fd
    gtrash
    lnav
    parallel
    ripgrep
    ripgrep-all
    sd
    tree
  ];

}
