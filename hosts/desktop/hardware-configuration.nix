{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/4a7dea96-c8a0-438b-9477-d8a0f357d92e";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/A35E-2111";
      fsType = "vfat";
    };
    "/mnt/elements" = {
      device = "/dev/disk/by-uuid/AAC8CF3AC8CF0393";
      fsType = "ntfs3";
    };
    ${config.homelab.mediaDir} = {
      device = "/mnt/elements/media";
      options = [ "bind" ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/8458c549-7f00-43e2-bf05-fc0029b35816"; }
    {
      device = "/var/lib/swapfile";
      size = 32 * 1024;
    }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp6s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
