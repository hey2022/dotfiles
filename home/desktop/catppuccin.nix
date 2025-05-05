{inputs, ...}: {
  imports = [inputs.catppuccin.homeModules.catppuccin];
  catppuccin = {
    enable = true;
    flavor = "mocha";
    hyprlock.useDefaultConfig = false;
    gtk.enable = true;
    wezterm.apply = true;

    # https://github.com/catppuccin/nix/issues/552
    mako.enable = false;
  };
}
