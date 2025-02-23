{pkgs, ...}: let
  beetsSettings = import ../../../.config/beets/config.nix;
in {
  home.packages = [pkgs.ffmpeg];
  programs.beets = {
    enable = true;
    settings = beetsSettings;
  };
}
