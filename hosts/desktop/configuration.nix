{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./sops.nix
    ../../system
    ../../system/desktop/hyprland.nix
    ../../system/programs/utilities
    ../../system/desktop
    ../../system/desktop/hyprland.nix
    ../../system/services/homelab.nix
    ../../system/network/mullvad.nix
  ];

  networking.hostName = "desktop";

  host.address = "hey2022.duckdns.org";
  services.caddy.globalConfig = ''
    acme_dns duckdns {env.DUCKDNS_TOKEN}
  '';

  time.timeZone = "Asia/Shanghai";

  users.users.yiheng = {
    isNormalUser = true;
    extraGroups =
      config.users.baseGroups
      ++ [
        "media"
      ];
    shell = pkgs.fish;
  };

  profiles.gaming.enable = true;
}
