{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./sops.nix
    ./cloudflared.nix
    ../../system
    ../../system/desktop
  ];

  networking.hostName = "desktop";

  host.address = "hey2022.dev";
  time.timeZone = "Asia/Shanghai";
  system.stateVersion = "25.05";

  users.users.yiheng = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = config.users.baseGroups ++ [
      "media"
    ];
  };

  profiles = {
    gaming.enable = true;
    homelab = {
      enable = true;
      media.enable = true;
    };
  };
  programs = {
    fish.enable = true;
    hyprland.enable = true;
  };
}
