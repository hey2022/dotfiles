{ config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./sops.nix
    ./cloudflared.nix
    ../../system
    ../../system/desktop/hyprland.nix
    ../../system/desktop
    ../../system/desktop/hyprland.nix
    ../../system/services/homelab
  ];

  networking.hostName = "desktop";

  host.address = "hey2022.dev";
  time.timeZone = "Asia/Shanghai";
  system.stateVersion = "25.05";

  users.users.yiheng = {
    isNormalUser = true;
    extraGroups = config.users.baseGroups ++ [
      "media"
    ];
  };

  profiles.gaming.enable = true;
  homelab.enable = true;
  programs = {
    fish.enable = true;
    niri.enable = true;
  };
}
