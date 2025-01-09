{pkgs, ...}: {
  home.packages = with pkgs; [
    ocrmypdf
    poppler_utils
  ];
}
