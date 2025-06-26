{pkgs, ...}: {
  imports = [
    ./anime.nix
    ./browsers
    ./cli
    ./encryption.nix
    ./games
    ./media
    ./proxy
    ./social
    ./torrent.nix
  ];
  home.packages = with pkgs; [
    keepassxc
  ];
}
