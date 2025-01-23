{pkgs, ...}: {
  imports = [./programs/video/mpv.nix];
  home.packages = with pkgs; [
    trackma
  ];
}
