{...}: {
  programs = {
    git = {
      enable = true;
      userEmail = "yiheng.he@proton.me";
      userName = "Yiheng He";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
      };
      signing = {
        key = null;
        signByDefault = true;
      };
      delta = {
        enable = true;
      };
    };
    lazygit = {
      enable = true;
    };
  };
}
