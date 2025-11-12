{ pkgs, ... }:

{
  programs.zathura = {
    package = pkgs.zathura.override {
      useMupdf = true;
    };
    options = {
      recolor = false;
      recolor-keephue = true;
      recolor-reverse-video = true;
      render-loading = false;
      render-loading-bg = "#FFFFFF";
      selection-clipboard = "clipboard";
    };
  };
}
