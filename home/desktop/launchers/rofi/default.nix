{
  config,
  pkgs,
  ...
}:
{
  programs.rofi = {
    package = pkgs.rofi-wayland;
    configPath = "";
  };
  xdg.configFile."rofi/config.rasi".source = config.lib.hm.mkFlakeSymlink ./config.rasi;
}
