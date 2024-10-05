{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.git = {
    enable = true;
    userEmail = "yiheng.he@proton.me";
    userName = "Yiheng He";
    extraConfig.init.defaultBranch = "main";
    signing = {
      key = null;
      # signByDefault = true;
    };
    delta = {
      enable = true;
    };
  };
}
