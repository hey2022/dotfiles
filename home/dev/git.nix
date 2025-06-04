{pkgs, ...}: {
  programs = {
    git = {
      enable = true;
      userEmail = "yiheng.he@proton.me";
      userName = "Yiheng He";
      extraConfig = {
        branch.sort = "-committerdate";
        column.ui = "auto";
        diff = {
          algorithm = "histogram";
          colorMoved = "plain";
          mnemonicPrefix = true;
          renames = true;
        };
        fetch = {
          all = true;
          prune = true;
          pruneTags = true;
        };
        init.defaultBranch = "main";
        merge = {
          conflictstyle = "zdiff3";
        };
        pull.rebase = true;
        push = {
          autoSetupRemote = true;
          followTags = true;
        };
        rebase = {
          autoSquash = true;
          autoStash = true;
          updateRefs = true;
        };
        tag.sort = "version:refname";
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
