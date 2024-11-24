{pkgs, ...}: {
  home.packages = with pkgs; [
    dolphin
    kdePackages.qtwayland
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kio-extras-kf5
    kdePackages.kdegraphics-thumbnailers
  ];
}
