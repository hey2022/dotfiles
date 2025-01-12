{pkgs, ...}: {
  home.packages = with pkgs; [
    okular
    ocrmypdf
    poppler_utils
  ];
}
