{
  inputs,
  config,
  lib,
  ...
}: {
  config.lib.hm = {
    mkFlakeSymlink = path:
      config.lib.file.mkOutOfStoreSymlink (config.home.dotfiles + lib.removePrefix (toString inputs.self) (toString path));
  };
}
