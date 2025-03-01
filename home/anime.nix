{pkgs, ...}: {
  imports = [./programs/torrent.nix ./programs/media];
  home.packages = with pkgs; [
    trackma
  ];
}
