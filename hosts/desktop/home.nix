{pkgs, ...}: {
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/sway
    ../../home/programs/games
    ../../home/dev
    ../../home/programs/cli
    ../../home/programs/wechat.nix
    ../../home/programs/torrent.nix
    ../../home/programs/browsers
    ../../home/profiles/education.nix
    ../../home/profiles/gaming.nix
  ];
  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";

  home.packages = with pkgs; [
    keepassxc
    feishin
  ];
}
