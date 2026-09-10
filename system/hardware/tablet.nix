{
  pkgs,
  pkgs-local,
  lib,
  ...
}:
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
  services.udev.packages = lib.singleton (
    pkgs.writeTextFile {
      name = "otd-rules";
      text = ''
        # Wacom CTL-6100WL
        KERNEL=="hidraw*", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0378", TAG+="uaccess", TAG+="udev-acl"
        KERNEL=="hidraw*", KERNELS=="0005:056A:0378.*", TAG+="uaccess", TAG+="udev-acl"
        SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0378", TAG+="uaccess", TAG+="udev-acl"
        # Wacom CTL-6100WL
        KERNEL=="hidraw*", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0379", TAG+="uaccess", TAG+="udev-acl"
        KERNEL=="hidraw*", KERNELS=="0005:056A:0379.*", TAG+="uaccess", TAG+="udev-acl"
        SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0379", TAG+="uaccess", TAG+="udev-acl"

        # Wacom CTL-6100WL
        KERNEL=="hidraw*", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="03c7", TAG+="uaccess", TAG+="udev-acl"
        KERNEL=="hidraw*", KERNELS=="0005:056A:03C7.*", TAG+="uaccess", TAG+="udev-acl"
        SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="03c7", TAG+="uaccess", TAG+="udev-acl"
        # Wacom CTL-6100WL
        KERNEL=="hidraw*", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="03c8", TAG+="uaccess", TAG+="udev-acl"
        KERNEL=="hidraw*", KERNELS=="0005:056A:03C8.*", TAG+="uaccess", TAG+="udev-acl"
        SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="03c8", TAG+="uaccess", TAG+="udev-acl"
      '';
      destination = "/etc/udev/rules.d/70-otd.rules";
    }
  );
}
