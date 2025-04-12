{pkgs, ...}: {
  programs.firefox.nativeMessagingHosts = with pkgs; [tridactyl-native];
  xdg.configFile."tridactyl/tridactylrc".source = ./tridactylrc;
}
