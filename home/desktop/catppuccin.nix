{inputs, ...}: {
  imports = [inputs.catppuccin.homeManagerModules.catppuccin];
  catppuccin = {
    enable = true;
    flavor = "mocha";
    hyprlock.useDefaultConfig = false;
    gtk.enable = true;
  };
  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };
}
