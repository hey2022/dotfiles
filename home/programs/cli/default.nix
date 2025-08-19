{ pkgs, ... }:

{
  imports = [
    ./aria2.nix
    ./atuin.nix
    ./fzf.nix
    ./network.nix
    ./television
    ./topgrade
    ./yazi.nix
    ./yt-dlp.nix
    ./zip.nix
  ];

  home.packages = with pkgs; [
    fastmod
  ];
}
