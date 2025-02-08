{...}: {
  home.shellAliases = {
    ls = "eza --icons";
    la = "eza -lag";
    ll = "eza -lg";
    cd = "z";
    cat = "bat";
    ec = "emacsclient -nw";
    ff = "fastfetch";
    uctl = "systemctl --user";

    tp = "trash put";

    activate = "source ./venv/bin/activate";
  };
}
