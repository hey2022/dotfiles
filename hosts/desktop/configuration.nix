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
    ../../system/game.nix
  ];

  networking.hostName = "desktop";

  host.address = "hey2022.duckdns.org";
  services.caddy.globalConfig = ''
    acme_dns duckdns {env.DUCKDNS_TOKEN}
  '';

  time.timeZone = "Asia/Shanghai";

  users.users.yiheng = {
    isNormalUser = true;
    extraGroups = [
      "media"
      "networkmanager"
      "uinput"
      "wheel"
      "wireshark"
    ];
    shell = pkgs.fish;
  };
}
