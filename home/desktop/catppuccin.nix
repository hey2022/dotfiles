{inputs, ...}: {
  imports = [inputs.catppuccin.homeManagerModules.catppuccin];
  catppuccin = {
    enable = true;
    flavor = "mocha";
    cursors.enable = true;
  };
  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };
}
