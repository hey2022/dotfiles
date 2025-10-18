{
  home.shellAliases = {
    eza = "eza --icons -gHi";
    ll = "ls -l";
    la = "ls -la";
    cd = "z";
    ec = "emacsclient -nw";
    ff = "fastfetch";
    uctl = "systemctl --user";
    zj = "zellij";

    tp = "gtrash put";
    s = "sesh connect $(sesh list --zoxide --icons | fzf --ansi)";
    S = "sesh connect $(sesh list --icons | fzf --ansi)";
  };
}
