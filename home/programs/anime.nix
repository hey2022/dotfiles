{pkgs, ...}: {
  imports = [
    ./torrent.nix
    ./media
  ];
  home.packages = with pkgs; [
    ani-cli
    trackma
  ];
}
