{...}: {
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
      recolor = false;
      recolor-keephue = true;
    };
  };
}
