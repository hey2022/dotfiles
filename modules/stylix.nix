{pkgs, ...}: {
  stylix = {
    enable = true;
    polarity = "dark";
    image = ../wallpapers/five-minutes-of-silence.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
  };
}
