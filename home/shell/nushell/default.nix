{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [../.];
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    envFile.source = ./env.nu;
    shellAliases = {
      la = "ls -la";
      ll = "ls -l";
      cd = "z";
      cat = "bat";
      ec = "emacsclient -c";
      ff = "fastfetch";

      rmt = "trash-put";
    };
  };
}
