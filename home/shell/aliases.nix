{...}: {
  home.shellAliases = {
    ls = "eza --icons";
    la = "ls -la";
    ll = "ls -l";
    cd = "z";
    cat = "bat";
    ec = "emacsclient -nw";
    ff = "fastfetch";

    tp = "trash put";

    activate = "source ./venv/bin/activate";
  };
}
