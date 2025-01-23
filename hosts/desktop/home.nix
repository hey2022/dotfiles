{pkgs, ...}: {
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/hyprland
    ../../home/desktop/sway
    ../../home/programs/games
    ../../home/dev
    ../../home/anime.nix
    ../../home/programs/cli
    ../../home/programs/wechat.nix
    ../../home/programs/rss.nix
    ../../home/programs/torrent.nix
    ../../home/programs/browsers
    ../../home/profiles/education.nix
    ../../home/profiles/gaming.nix
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";

  home.packages = with pkgs; [
    keepassxc
  ];
}
