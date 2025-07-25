{ pkgs, ... }:
{
  imports = [
    ./anime.nix
    ./anki.nix
    ./browsers
    ./calculator.nix
    ./cli
    ./dictionary.nix
    ./email.nix
    ./encryption.nix
    ./games
    ./media
    ./pandoc.nix
    ./productivity
    ./proxy
    ./rss.nix
    ./social
    ./torrent.nix
  ];
  home.packages = with pkgs; [
    keepassxc
  ];
}
