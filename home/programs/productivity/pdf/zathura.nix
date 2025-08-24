{ pkgs, ... }:

{
  programs.zathura = {
    package = pkgs.zathura.override {
      useMupdf = false;
    };
    options = {
      selection-clipboard = "clipboard";
      recolor-keephue = true;
      recolor-reverse-video = true;
    };
  };
}
