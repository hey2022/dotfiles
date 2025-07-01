{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    "${inputs.self}/home/dev/emacs"
  ];
  programs.firefox.nativeMessagingHosts = with pkgs; [ tridactyl-native ];
  programs.zen-browser.nativeMessagingHosts = with pkgs; [ tridactyl-native ];
  xdg.configFile."tridactyl/tridactylrc".source = config.lib.hm.mkFlakeSymlink ./tridactylrc;
}
