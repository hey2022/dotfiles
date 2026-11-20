{ config, lib, ... }:

let
  cfg = config.programs.noctalia;
in
{
  config = lib.mkIf cfg.enable {
    programs.noctalia = {
      systemd.enable = true;
    };
    xdg.configFile."noctalia".source = config.lib.hm.mkFlakeSymlink ./config;
  };
}
