{
  inputs,
  config,
  pkgs,
  ...
}: {
  programs.wezterm = {
    enable = true;
    package = config.lib.nixGL.wrap inputs.wezterm.packages.${pkgs.system}.default;
    extraConfig = builtins.readFile ./wezterm.lua;
  };
}
