{
  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      includes = [ { path = "~/.config/git/maintenance"; } ];
      settings = {
        aliases = {
          maintain = "maintenance register --config-file $HOME/.config/git/maintenance";
        };
        user = {
          email = "yiheng.he@proton.me";
          name = "Yiheng He";
        };
        branch.sort = "-committerdate";
        column.ui = "auto";
        core = {
          fsmonitor = true;
          untrackedcache = true;
          editor = "nvim";
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
    };
    lazygit = {
      enable = true;
    };
    difftastic = {
      enable = true;
      git.enable = true;
    };
    mergiraf = {
      enable = true;
      enableGitIntegration = true;
    };
  };
}
