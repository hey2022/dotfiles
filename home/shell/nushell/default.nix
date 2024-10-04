{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    shellAliases = {
      la = "ls -la";
      ll = "ls -l";
      cd = "z";
      cat = "bat";
      ec = "emacsclient -c";
      ff = "fastfetch";

      rm = ''echo "This is not the command you are looking for."; false'';
      rmt = "trash-put";
    };
  };
}
