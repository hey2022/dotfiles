{ lib, ... }:

{
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    shellAliases = {
      s = lib.mkForce "sesh connect (sesh list --zoxide --icons | fzf --ansi)";
      S = lib.mkForce "sesh connect (sesh list --icons | fzf --ansi)";
    };
  };
}
