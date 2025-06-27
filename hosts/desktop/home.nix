{...}: {
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/hyprland
    ../../home/dev
    ../../home/programs/rss.nix
    ../../home/programs/torrent.nix
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";

  profiles.gaming.enable = false;
}
