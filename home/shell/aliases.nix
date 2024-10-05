{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.shellAliases = {
    ls = "eza --icons";
    la = "ls -la";
    ll = "ls -l";
    cd = "z";
    cat = "bat";
    ec = "emacsclient -c";
    ff = "fastfetch";

    rm = ''echo "This is not the command you are looking for."; false'';
    rmt = "trash-put";

    activate = "source ./venv/bin/activate";
  };
}
