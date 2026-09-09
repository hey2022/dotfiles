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
    SUBSYSTEM=="hidraw", MODE="0666", TAG+="uaccess", TAG+="udev-acl"
  '';
}
