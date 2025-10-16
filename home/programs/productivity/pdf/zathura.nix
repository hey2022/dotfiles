{ pkgs, ... }:

{
  programs.zathura = {
    package = pkgs.zathura.override {
      useMupdf = true;
    };
    options = {
      selection-clipboard = "clipboard";
      recolor = false;
      recolor-keephue = true;
      recolor-reverse-video = true;
    };
  };
}
