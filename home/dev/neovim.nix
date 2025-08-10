{
  self,
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nvim
    nnvim
  ];
  xdg.configFile."nvim".source = config.lib.hm.mkFlakeSymlink "${self}/common/nvim";
}
