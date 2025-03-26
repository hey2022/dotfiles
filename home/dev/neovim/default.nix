{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
  ];
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
  };
}
