{pkgs, ...}: {
  home.packages = with pkgs; [
    dolphin
    kdePackages.qtwayland
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kdegraphics-thumbnailers
  ];
}
