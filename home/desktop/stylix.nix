{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.stylix.homeManagerModules.stylix ../../common/stylix.nix];

  stylix = {
    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus";
    };
    targets = {
      wezterm.enable = true;
    };
  };
}
