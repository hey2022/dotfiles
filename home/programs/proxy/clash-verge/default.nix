{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    clash-verge-rev
  ];

  xdg.dataFile."io.github.clash-verge-rev.clash-verge-rev/profiles/Merge.yaml".source =
    config.lib.hm.mkFlakeSymlink ./Merge.yaml;
  xdg.dataFile."io.github.clash-verge-rev.clash-verge-rev/profiles/Script.js".source =
    config.lib.hm.mkFlakeSymlink ./Script.js;
}
