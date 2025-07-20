{ config, pkgs, ... }:

{
  programs.television = {
    enable = true;
  };
  home.packages = with pkgs; [
    bat
    fd
    nix-search-tv
    ripgrep
  ];
  xdg.configFile."television/cable".source = config.lib.hm.mkFlakeSymlink ./cable;
}
