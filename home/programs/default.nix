{ pkgs, pkgs-local, ... }:
{
  imports = [
    ./anime.nix
    ./anki
    ./browsers
    ./cli
    ./email.nix
    ./encryption.nix
    ./games
    ./media
    ./monitoring.nix
    ./music.nix
    ./pandoc.nix
    ./productivity
    ./qalculate
    ./rss.nix
    ./social
    ./todo.nix
    ./torrent.nix
  ];
  home.packages = [
    pkgs-local.keepassxc-snapshot
    pkgs.czkawka
  ];
}
