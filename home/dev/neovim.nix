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
  programs.neovide = {
    enable = true;
  };
  xdg.configFile."nvim".source = config.lib.hm.mkFlakeSymlink "${self}/common/nvim";
}
