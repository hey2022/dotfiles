{ pkgs, ... }:
{
  imports = [
    ./anime.nix
    ./anki
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
    ./torrent.nix
  ];
  home.packages = with pkgs; [
    czkawka
    keepassxc
  ];
}
