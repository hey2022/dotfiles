{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    qalculate-qt
  ];
  xdg.dataFile."qalculate/definitions".source = config.lib.hm.mkFlakeSymlink ./definitions;
}
