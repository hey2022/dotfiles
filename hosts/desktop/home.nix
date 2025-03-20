{pkgs, ...}: {
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/hyprland
    ../../home/programs/games
    ../../home/dev
    ../../home/anime.nix
    ../../home/programs/wechat.nix
    ../../home/programs/rss.nix
    ../../home/programs/torrent.nix
    ../../home/profiles/education.nix
    ../../home/profiles/gaming.nix
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";

  home.packages = with pkgs; [
    keepassxc
  ];
}
