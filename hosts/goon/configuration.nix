{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix

    ../../system
    ../../system/laptop
    ../../system/desktop
    ../../system/shell/fish.nix
    ../../system/network/mullvad.nix
    ../../system/network/mac-spoof.nix
  ];

  boot.kernelParams = ["i915.enable_dc=0"];

  networking.hostName = "goon";

  time.timeZone = "Asia/Shanghai";

  users.users.yiheng = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.fish;
  };
}
