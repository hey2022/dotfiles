{
  config,
  pkgs,
  ...
}: {
  programs.wezterm = {
    package = config.lib.nixGL.wrap pkgs.wezterm;
    extraConfig = builtins.readFile ./wezterm.lua;
  };
}
