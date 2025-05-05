{pkgs, ...}: {
  imports = [
    ./anime.nix
    ./browsers
    ./cli
    ./social
  ];
  home.packages = with pkgs; [
    keepassxc
  ];
}
