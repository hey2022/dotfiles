{pkgs, ...}: {
  programs = {
    git = {
      enable = true;
      userEmail = "yiheng.he@proton.me";
      userName = "Yiheng He";
      extraConfig = {
        init.defaultBranch = "main";
        fetch = {
          all = true;
          prune = true;
          pruneTags = true;
        };
        push = {
          autoSetupRemote = true;
          followTags = true;
        };
        rebase = {
          autoSquash = true;
          autoStash = true;
          updateRefs = true;
        };
        pull.rebase = true;
      };
      signing = {
        key = null;
        signByDefault = true;
      };
      difftastic = {
        enable = true;
      };
      aliases = {
        cleanup = "!git branch --merged | grep -Ev '(^\\*|^\\+|master|main|dev)' | xargs -r git branch -d";
      };
    };
    lazygit = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    onefetch
  ];
}
