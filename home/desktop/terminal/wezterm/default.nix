{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ../../../shell/nushell ];
  programs.wezterm = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.wezterm;
    extraConfig = builtins.readFile ./wezterm.lua;
  };
}
