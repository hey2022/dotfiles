{ pkgs, ... }:
{
  home.packages = with pkgs; [
    feishin
    songrec
    youtube-music
  ];
}
