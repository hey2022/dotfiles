{ pkgs, ... }:
let
  beetsSettings = import ../../../common/beets.nix;
in
{
  home.packages = [ pkgs.ffmpeg ];
  programs.beets = {
    enable = true;
    settings = beetsSettings;
  };
}
