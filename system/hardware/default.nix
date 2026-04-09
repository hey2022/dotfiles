{
  imports = [
    ./logitech.nix
    ./tablet.nix
    ./thinkpad.nix
    ./fan.nix
  ];
  services.fwupd.enable = true;
}
