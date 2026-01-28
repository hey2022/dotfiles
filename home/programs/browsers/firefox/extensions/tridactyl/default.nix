{ config, ... }:

{
  xdg.configFile."tridactyl/tridactylrc".source = config.lib.hm.mkFlakeSymlink ./tridactylrc;
}
