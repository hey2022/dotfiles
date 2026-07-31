{ self, config, ... }:

{
  services.awww.enable = true;
  xdg.configFile."wallpapers".source = config.lib.hm.mkFlakeSymlink "${self}/assets/wallpapers";
}
