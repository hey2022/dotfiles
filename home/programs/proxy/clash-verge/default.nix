{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    clash-verge-rev
  ];
  home.file.".local/share/io.github.clash-verge-rev.clash-verge-rev/profiles/Merge.yaml".source = config.lib.hm.mkFlakeSymlink ./Merge.yaml;
}
