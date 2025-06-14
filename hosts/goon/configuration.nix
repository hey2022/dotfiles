{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-6th-gen

    ../../system
    ../../system/desktop
    ../../system/desktop/hyprland.nix
    ../../system/network/mac-spoof.nix
  ];

  boot.kernelParams = ["i915.enable_dc=0"];

  networking.hostName = "goon";
  host.laptop = true;

  time.timeZone = "Asia/Shanghai";

  users.users.yiheng = {
    isNormalUser = true;
    extraGroups = config.users.baseGroups;
    shell = pkgs.fish;
  };

  profiles = {
    gaming.enable = false;
    vm.enable = false;
  };
}
