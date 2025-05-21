{pkgs, ...}: {
  imports = [
    ./anime.nix
    ./browsers
    ./cli
    ./encryption.nix
    ./games
    ./social
  ];
  home.packages = with pkgs; [
    keepassxc
  ];
}
