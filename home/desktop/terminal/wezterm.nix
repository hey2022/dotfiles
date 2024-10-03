{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.wezterm = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.wezterm;
  };
}
