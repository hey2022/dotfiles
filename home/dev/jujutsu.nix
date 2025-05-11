{...}: {
  programs.jujutsu = {
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
        editor = "emacsclient -nw";
      };
    };
  };
}
