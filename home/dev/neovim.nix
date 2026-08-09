{ config, pkgs-local, ... }:

{
  home.packages = [ pkgs-local.nvim-unwrapped ];
  xdg.configFile."nvim".source =
    config.lib.hm.mkFlakeSymlink ../../flake-modules/nix-wrapper-modules/nvim;
}
