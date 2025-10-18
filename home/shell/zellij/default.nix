{ config, pkgs, ... }:

{
  import = [ ./zjs ];
  home.packages = [ pkgs.zellij ];
  xdg.configFile."zellij/config.kdl".source = config.lib.hm.mkFlakeSymlink ./config.kdl;
}
