{ config, pkgs, ... }:

{
  programs.television = {
    enable = true;
  };
  home.packages = with pkgs; [
    fd
    bat
    nix-search-tv
  ];
  xdg.configFile."television/cable".source = config.lib.hm.mkFlakeSymlink ./cable;
}
