{ config, ... }:

{
  xdg.configFile."input-remapper-2" = {
    source = config.lib.hm.mkFlakeSymlink ./input-remapper;
  };
}
