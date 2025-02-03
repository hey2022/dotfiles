{pkgs, ...}: {
  imports = [./programs/torrent.nix ./programs/video/mpv.nix];
  home.packages = with pkgs; [
    trackma
  ];
}
