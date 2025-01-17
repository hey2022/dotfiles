{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../system/programs/steam.nix
    ../../system/programs/utilities
    ../../system/desktop
    ../../system/desktop/hyprland.nix
    ../../system/services/navidrome.nix
    ../../system/flatpak.nix
    ../../system/network/mullvad.nix
    ../../system/shell/fish.nix
  ];

  networking.hostName = "desktop";

  time.timeZone = "Asia/Shanghai";

  users.users.yiheng = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.fish;
  };

  services = {
    myNavidrome = {
      enable = true;
      MusicFolder = "/home/yiheng/music";
    };
  };

  programs.ydotool = {
    enable = true;
    users = ["yiheng"];
  };
}
