{
  self,
  config,
  pkgs-local,
  ...
}:

{
  home.packages = [ pkgs-local.nvim-unwrapped ];
  xdg.configFile."nvim".source =
    config.lib.hm.mkFlakeSymlink "${self}/modules/flake/nix-wrapper-modules/nvim";
}
