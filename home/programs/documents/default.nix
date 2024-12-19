{pkgs, ...}: {
  home.packages = with pkgs; [okular ocrmypdf];
}
