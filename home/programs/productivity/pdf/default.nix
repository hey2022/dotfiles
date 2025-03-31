{pkgs, ...}: {
  imports = [
    ./zathura.nix
  ];
  home.packages = with pkgs; [
    kdePackages.okular
    ocrmypdf
    poppler_utils
  ];
}
