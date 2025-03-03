{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-6th-gen

    ../../system
    ../../system/laptop
    ../../system/desktop
    ../../system/desktop/hyprland.nix
    ../../system/network/mullvad.nix
    ../../system/network/mac-spoof.nix
  ];

  boot.kernelParams = ["i915.enable_dc=0"];

  networking.hostName = "goon";

  time.timeZone = "Asia/Shanghai";

  users.users.yiheng = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.fish;
  };
}
