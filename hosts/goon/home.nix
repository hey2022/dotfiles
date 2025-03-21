{pkgs, ...}: {
  imports = [
    ../../home
    ../../home/desktop
    ../../home/desktop/hyprland
    ../../home/dev
    ../../home/anime.nix
    ../../home/profiles/education.nix
    ../../home/profiles/gaming.nix
    ../../home/services/lid-inhibit-lock.nix
  ];

  home.username = "yiheng";
  home.homeDirectory = "/home/yiheng";
  host.laptop = true;

  home.packages = with pkgs; [
    keepassxc
  ];
}
