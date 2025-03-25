{inputs, ...}: {
  imports = [inputs.catppuccin.homeManagerModules.catppuccin];
  catppuccin = {
    enable = true;
    flavor = "mocha";
    hyprlock.useDefaultConfig = false;
    gtk.enable = true;
  };
}
