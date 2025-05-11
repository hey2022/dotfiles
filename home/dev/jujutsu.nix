{...}: {
  programs.jujutsu = {
    enable = false;
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
      aliases = {
        tug = ["bookmark" "move" "--from" "heads(::@- & bookmarks())" "--to" "@-"];
      };
    };
  };
}
