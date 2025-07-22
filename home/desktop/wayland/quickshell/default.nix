{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    qt6Packages.qtmultimedia
  ];
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
    activeConfig = "default";
    configs = {
      default = config.lib.hm.mkFlakeSymlink ./default;
    };
  };
}
