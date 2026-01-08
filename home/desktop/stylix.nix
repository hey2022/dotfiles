{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.stylix.homeModules.stylix
    ../../common/stylix.nix
  ];

  stylix = {
    icons = {
      enable = false;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus";
    };
    targets = {
      fuzzel.enable = true;
      gtk.enable = true;
      wezterm.enable = true;
    };
  };
}
