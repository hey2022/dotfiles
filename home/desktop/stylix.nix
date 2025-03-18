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
      hyprland.hyprpaper.enable = false;
      # https://github.com/danth/stylix/issues/933
      qt.enable = true;
    };
  };
}
