{ self, config, ... }:

{
  imports = [
    ./awww.nix
    ./wallpaper-engine.nix
  ];
  services.awww.enable = true;
  xdg.configFile."wallpapers".source = config.lib.hm.mkFlakeSymlink "${self}/assets/wallpapers";
}
