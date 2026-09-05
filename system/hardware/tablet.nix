{ self, pkgs, ... }:
{
  # HACK: https://github.com/OpenTabletDriver/OpenTabletDriver/issues/2118 running custom build of OTD
  hardware = {
    opentabletdriver = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.opentabletdriver-patched;
    };
    uinput.enable = true;
  };
  boot.kernelModules = [ "uinput" ];
  services.udev.extraRules = ''
    SUBSYSTEM=="hidraw", MODE="0666", TAG+="uaccess", TAG+="udev-acl"
  '';
}
