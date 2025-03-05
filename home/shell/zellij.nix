{...}: {
  programs.zellij = {
    enable = true;
  };
  home.sessionVariables = {
    ZELLIJ_AUTO_ATTACH = "true";
    ZELLIJ_AUTO_EXIT = "true";
  };
}
