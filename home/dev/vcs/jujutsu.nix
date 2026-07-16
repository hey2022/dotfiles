{
  programs = {
    jujutsu = {
      enable = true;
      settings = {
        user = {
          email = "yiheng.he@proton.me";
          name = "Yiheng He";
        };
        signing = {
          behavior = "own";
          backend = "gpg";
        };
        ui = {
          editor = "nvim";
        };
        aliases = {
          tug = [
            "bookmark"
            "move"
            "--from"
            "heads(::@- & bookmarks())"
            "--to"
            "@-"
          ];
        };
      };
    };
    jjui = {
      enable = true;
    };
    delta = {
      enable = true;
      enableJujutsuIntegration = true;
    };
    mergiraf = {
      enable = true;
      enableJujutsuIntegration = true;
    };
  };
}
