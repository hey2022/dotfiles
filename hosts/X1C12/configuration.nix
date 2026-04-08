{
  inputs,
  config,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-12th-gen

    ./sops.nix
    ../../system
    ../../system/desktop
  ];

  networking.hostName = "X1C12";
  time.timeZone = "Asia/Shanghai";
  system.stateVersion = "25.11";

  host.laptop = true;
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];
    "/.swapvol".options = [ "noatime" ];
  };

  swapDevices = [
    {
      device = "/.swapvol/swapfile";
      size = 64 * 1024;
    }
  ];

  hardware.thinkpad.enable = true;

  # https://wiki.archlinux.org/title/Intel_graphics#Testing_the_new_experimental_Xe_driver
  # These params conflict with ones set in nixos-hardware so mkAfter is used
  boot.kernelParams = lib.mkAfter [
    "i915.force_probe=!7d55"
    "xe.force_probe=7d55"
  ];

  users.users.yiheng = {
    isNormalUser = true;
    extraGroups = config.users.baseGroups;
  };

  profiles = {
    gaming.enable = false;
    vm.enable = false;
  };
  programs = {
    fish.enable = true;
    niri.enable = true;
  };

  services = {
    fprintd.enable = true;
  };
}
