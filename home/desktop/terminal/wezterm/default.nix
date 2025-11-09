{
  programs.wezterm = {
    extraConfig = builtins.readFile ./wezterm.lua;
  };
}
