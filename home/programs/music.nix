{pkgs, ...}: {
  home.packages = with pkgs; [supersonic-wayland];
}
