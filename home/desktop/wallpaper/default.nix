{ self, config, ... }:
{
  imports = [
    ./waypaper.nix
  ];
  services.swww.enable = true;
  xdg.configFile."wallpapers".source = config.lib.hm.mkFlakeSymlink "${self}/assets/wallpapers";
}
