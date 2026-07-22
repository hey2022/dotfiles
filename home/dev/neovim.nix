{
  self,
  config,
  pkgs-local,
  ...
}:
{
  home.packages = with pkgs-local; [
    nvim
    nnvim
  ];
  programs.neovide = {
    enable = true;
  };
  xdg.configFile."nvim".source = config.lib.hm.mkFlakeSymlink "${self}/common/nvim";
}
