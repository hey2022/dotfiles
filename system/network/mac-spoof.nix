_:
let
  spoofed-mac-address = "B4:AD:A3:F8:84:05";
in
{
  networking.networkmanager = {
    wifi.macAddress = spoofed-mac-address;
    ethernet.macAddress = spoofed-mac-address;
  };
}
