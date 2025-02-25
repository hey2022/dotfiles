{pkgs, ...}: {
  home.packages = with pkgs; [
    kdePackages.okular
    ocrmypdf
    poppler_utils
  ];
}
