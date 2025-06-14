{pkgs, ...}: {
  imports = [
    ./anime.nix
    ./browsers
    ./cli
    ./encryption.nix
    ./games
    ./proxy
    ./social
  ];
  home.packages = with pkgs; [
    keepassxc
  ];
}
