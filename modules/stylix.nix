{
  config,
  pkgs,
  ...
}: let
  fonts = import ../lib/fonts.nix {inherit pkgs;};
in {
  stylix = {
    enable = true;
    polarity = "dark";
    # https://github.com/nix-community/home-manager/issues/5743
    image = builtins.path {path = ../wallpapers/alena-aenami-eclipse-1k.jpg;};
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
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
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    opacity = {
      terminal = 0.9;
      applications = 0.9;
      desktop = 0.75;
      popups = 0.9;
    };
  };
}
