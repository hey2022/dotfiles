{ pkgs, ... }:
{
  imports = [ ./swap.nix ];
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        configurationLimit = 5;
      };
    };
    kernelPackages = pkgs.linuxPackages_cachyos;
    kernel.sysctl = {
      "kernel.sysrq" = 1;
    };
    supportedFilesystems = [
      "ntfs"
    ];
  };
}
