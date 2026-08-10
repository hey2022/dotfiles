{
  config,
  pkgs,
  ...
}:
{
  home = {
    packages = with pkgs; [
      mold
    ];
    file.".cargo/config.toml".source = config.lib.hm.mkFlakeSymlink ./config.toml;
  };
}
