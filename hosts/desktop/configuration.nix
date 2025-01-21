{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../system/desktop/hyprland.nix
    ../../system/programs/utilities
    ../../system/desktop
    ../../system/desktop/hyprland.nix
    ../../system/services/homelab.nix
    ../../system/flatpak.nix
    ../../system/network/mullvad.nix
    ../../system/game.nix
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
