{ self, config, ... }:

{
  imports = [
    ./swww.nix
    ./wallpaper-engine.nix
  ];
  services.swww.enable = true;
  xdg.configFile."wallpapers".source = config.lib.hm.mkFlakeSymlink "${self}/assets/wallpapers";
}
