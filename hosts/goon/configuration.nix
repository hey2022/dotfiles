{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix

    ../../system
    ../../system/laptop
    ../../system/desktop
    ../../system/services
    ../../system/shell/fish.nix
    ../../system/network/mullvad.nix
    ../../system/network/mac-spoof.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = ["i915.enable_dc=0"];

  networking.hostName = "goon";

  time.timeZone = "Asia/Shanghai";

  users.users.yiheng = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    home-manager
  ];
}
