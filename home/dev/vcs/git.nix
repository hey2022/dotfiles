{
  programs = {
    git = {
      enable = true;
      userEmail = "yiheng.he@proton.me";
      userName = "Yiheng He";
      lfs.enable = true;
      extraConfig = {
        branch.sort = "-committerdate";
        column.ui = "auto";
        core = {
          fsmonitor = true;
          untrackedcache = true;
        };
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
          writeCommitGraph = true;
        };
        gitbutler.signCommits = true;
        help.autocorrect = "prompt";
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
        rerere = {
          enabled = true;
          autoupdate = true;
        };
        tag.sort = "version:refname";
      };
      signing = {
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
