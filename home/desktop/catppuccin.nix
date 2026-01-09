{ inputs, ... }:
{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];
  catppuccin = {
    enable = true;
    flavor = "mocha";
    fcitx5.apply = false;
    hyprlock.useDefaultConfig = false;
    wezterm.apply = true;
  };
}
