{pkgs, ...}: {
  home.packages = with pkgs; [
    uutils-coreutils-noprefix
    findutils
    diffutils
  ];
}
