{ self, config, ... }:

{
  imports = [
    ./swww.nix
    ./wallpaper-engine.nix
  ];
  xdg.configFile."wallpapers".source = config.lib.hm.mkFlakeSymlink "${self}/assets/wallpapers";
}
