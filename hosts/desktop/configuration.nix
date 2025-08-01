{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./sops.nix
    ./cloudflared.nix
    ../../system
    ../../system/desktop/hyprland.nix
    ../../system/programs/utilities
    ../../system/desktop
    ../../system/desktop/hyprland.nix
    ../../system/services/homelab
  ];

  networking.hostName = "desktop";

  host.address = "hey2022.dev";
  time.timeZone = "Asia/Shanghai";

  users.users.yiheng = {
    isNormalUser = true;
    extraGroups = config.users.baseGroups ++ [
      "media"
    ];
    shell = pkgs.fish;
  };

  profiles.gaming.enable = false;
  homelab.enable = true;
  programs.niri.enable = true;
}
