{pkgs, ...}: {
  imports = [
    ./anime.nix
    ./browsers
    ./cli
    ./encryption.nix
    ./social
  ];
  home.packages = with pkgs; [
    keepassxc
  ];
}
