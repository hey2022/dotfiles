{pkgs, ...}: {
  imports = [
    ./cli
    ./browsers
    ./social
  ];
  home.packages = with pkgs; [
    keepassxc
  ];
}
