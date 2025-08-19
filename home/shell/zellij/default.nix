{ config, pkgs, ... }:

{
  home.packages = [ pkgs.zellij ];
  xdg.configFile."zellij/config.kdl".source = config.lib.hm.mkFlakeSymlink ./config.kdl;
}
