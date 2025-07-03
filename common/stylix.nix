{
  config,
  pkgs,
  pkgs-stable,
  ...
}:
let
  fonts = import ../common/fonts.nix { pkgs = pkgs-stable; };
in
{
  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    # HACK: https://github.com/nix-community/home-manager/issues/5743
    image = builtins.path { path = ../assets/wallpapers/alena-aenami-serenity-1k.jpg; };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    fonts = {
      serif = config.stylix.fonts.sansSerif;
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      monospace = {
        package = fonts.IosevkaCustom;
        name = "Iosevka Custom";
      };
      emoji = {
        package = pkgs.nerd-fonts.symbols-only;
        name = "Symbols Nerd Font";
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    opacity = {
      terminal = 0.5;
      applications = 0.5;
      desktop = 0.5;
      popups = 0.5;
    };
  };
}
