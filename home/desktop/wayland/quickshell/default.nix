{ config, ... }:

{
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
    activeConfig = "default";
    configs = {
      default = config.lib.hm.mkFlakeSymlink ./default;
    };
  };
}
