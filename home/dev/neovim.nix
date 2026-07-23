{
  self,
  config,
  pkgs-local,
  ...
}:
{
  home.packages = [ pkgs-local.nvim ];
  xdg.configFile."nvim".source = config.lib.hm.mkFlakeSymlink "${self}/common/nvim";
}
