{ config, ... }:

{
  programs.espanso-config = {
    configDir = config.lib.hm.mkFlakeSymlink ./config;
  };
}
