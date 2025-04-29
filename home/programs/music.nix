{pkgs, ...}: {
  home.packages = with pkgs; [
    feishin
    songrec
    spotube
  ];
}
