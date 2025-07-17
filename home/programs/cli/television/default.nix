{ config, ... }:

{
  programs.television = {
    enable = true;
  };
  xdg.configFile."television/cable".source = config.lib.hm.mkFlakeSymlink ./cable;
}
