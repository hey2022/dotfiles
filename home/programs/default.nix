{pkgs, ...}: {
  imports = [
    ./browsers
    ./cli
    ./social
  ];
  home.packages = with pkgs; [
    keepassxc
  ];
}
