{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # https://github.com/NixOS/nixpkgs/issues/287189
    kernelPackages = pkgs.linuxPackages_zen;
    kernel.sysctl."kernel.sysrq" = 1;
  };
}
