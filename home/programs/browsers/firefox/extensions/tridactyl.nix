{
  config,
  pkgs,
  ...
}: {
  programs.firefox.nativeMessagingHosts = with pkgs; [tridactyl-native];
  xdg.configFile."tridactyl/tridactylrc".source = config.lib.hm.mkFlakeSymlink ./tridactylrc;
}
