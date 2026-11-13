{
  services = {
    printing = {
      enable = true;
      browsed.enable = true;
    };
    ipp-usb.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
  security.pam.services.cups.fprintAuth = false;
}
