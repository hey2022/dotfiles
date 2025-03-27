{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./settings.nix
  ];
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
  };
}
