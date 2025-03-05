{...}: {
  programs.zellij = {
    enable = true;
  };
  home.sessionVariables = {
    ZELLIJ_AUTO_ATTACH = "true";
  };
}
