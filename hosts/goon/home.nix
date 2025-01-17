{pkgs, ...}: {
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/sway
    ../../home/dev
    ../../home/programs/cli
    ../../home/programs/browsers
    ../../home/programs/wechat.nix
    ../../home/profiles/education.nix
    ../../home/profiles/gaming.nix
    ../../home/services/lid-inhibit-lock.nix
  ];

  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";

  # Let Home Manager install and manage itself.
  home.packages = with pkgs; [
    # Apps
    keepassxc
    feishin
  ];
}
