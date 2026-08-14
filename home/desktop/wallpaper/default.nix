{ self, config, ... }:

{
  programs.waypaper.random.enable = true;
  xdg.configFile."wallpapers".source = config.lib.hm.mkFlakeSymlink "${self}/assets/wallpapers";
}
