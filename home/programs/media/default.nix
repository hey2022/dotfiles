{pkgs, ...}: {
  imports = [./mpv.nix];
  home.packages = with pkgs; [jellyfin-media-player];
}
