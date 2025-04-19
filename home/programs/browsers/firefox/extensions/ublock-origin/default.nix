{config, ...}: {
  home.file.".mozilla/managed-storage/uBlock0@raymondhill.net.json".source = config.lib.hm.mkFlakeSymlink ./managed-storage.json;
}
