{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../system/programs/steam.nix
    ../../system/programs/utilities
    ../../system/desktop
    ../../system/desktop/hyprland.nix
    ../../system/services
    ../../system/services/navidrome.nix
    ../../system/flatpak.nix
    ../../system/network/mullvad.nix
    ../../system/shell/fish.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "desktop";

  time.timeZone = "Asia/Shanghai";

  security.polkit.enable = true;
  hardware.graphics.enable = true;

  users.users.yiheng = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    fastfetch
    neovim

    home-manager
  ];

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
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
