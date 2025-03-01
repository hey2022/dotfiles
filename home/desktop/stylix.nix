{pkgs, ...}: {
  imports = [../../common/stylix.nix];
  stylix = {
    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus";
    };
    targets.hyprland.hyprpaper.enable = false;
  };
}
