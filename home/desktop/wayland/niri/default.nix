{ config, ... }:

{
  programs.niri = {
    configFile = config.lib.hm.mkFlakeSymlink ./config.kdl;
  };
}
