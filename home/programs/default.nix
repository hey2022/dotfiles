{ pkgs, ... }:
{
  imports = [
    ./anime.nix
    ./anki.nix
    ./browsers
    ./cli
    ./dictionary.nix
    ./email.nix
    ./encryption.nix
    ./games
    ./media
    ./pandoc.nix
    ./productivity
    ./proxy
    ./qalculate
    ./rss.nix
    ./social
    ./todo.nix
    ./torrent.nix
  ];
  home.packages = with pkgs; [
    czkawka
    keepassxc
  ];
}
