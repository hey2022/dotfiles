{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

let
  # MAXHUB-A401SE
  spoofed-mac-address = "DC:EC:4F:89:20:AF";
in
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-12th-gen

    ./sops.nix
    ../../system
    ../../system/desktop
  ];

  networking = {
    hostName = "X1C12";
    networkmanager = {
      wifi.macAddress = spoofed-mac-address;
      ethernet.macAddress = spoofed-mac-address;
    };
  };
  time.timeZone = "America/Chicago";
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

  users.users.yiheng = {
    isNormalUser = true;
    extraGroups = config.users.baseGroups;
    shell = pkgs.fish;
  };

  profiles = {
    gaming.enable = true;
    vm.enable = false;
  };
  programs = {
    fish.enable = true;
    hyprland.enable = true;
  };
  virtualisation.waydroid.enable = true;

  services = {
    fprintd.enable = true;
    throttled = {
      enable = true;
      extraConfig = lib.readFile ./throttled.conf;
    };
  };
}
