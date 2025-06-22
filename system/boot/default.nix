{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # TODO: Use switch to tkg https://github.com/NixOS/nixpkgs/issues/287189
    kernelPackages = pkgs.linuxPackages_zen;
    kernel.sysctl = {
      "kernel.sysrq" = 1;
      "vm.swappiness" = 10;
    };
  };
}
