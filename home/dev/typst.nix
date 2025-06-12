{pkgs, ...}: {
  home.packages = with pkgs; [
    tinymist
    typst
    typstyle
  ];
}
