{ pkgs-local, ... }:
{
  # HACK: https://github.com/OpenTabletDriver/OpenTabletDriver/issues/2118 running custom build of OTD
  hardware = {
    opentabletdriver = {
      enable = true;
      package = pkgs-local.opentabletdriver-patched;
    };
    uinput.enable = true;
  };
  boot.kernelModules = [ "uinput" ];
  services.udev.extraRules = ''
    KERNEL=="hidraw*", KERNELS=="0005:056A:03C8.*", MODE="0666"
  '';
}
