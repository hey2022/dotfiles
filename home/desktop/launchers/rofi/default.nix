{
  config,
  pkgs,
  ...
}:
{
  programs.rofi = {
    configPath = "";
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
    ];
  };
  xdg.configFile."rofi/config.rasi".source = config.lib.hm.mkFlakeSymlink ./config.rasi;
  xdg.dataFile."rofi/themes/theme.rasi".source = config.lib.hm.mkFlakeSymlink ./theme.rasi;
}
