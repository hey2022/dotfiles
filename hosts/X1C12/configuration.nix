{ inputs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-12th-gen

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
    thinkfan.enable = true;
  };

}
