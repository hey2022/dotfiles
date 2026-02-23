{
  inputs,
  config,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-6th-gen

    ../../system
    ../../system/desktop
    ../../system/network/mac-spoof.nix
  ];

  boot.kernelParams = [ "i915.enable_dc=0" ];

  networking.hostName = "goon";
  host.laptop = true;

  time.timeZone = "Asia/Shanghai";
  system.stateVersion = "25.05";

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
