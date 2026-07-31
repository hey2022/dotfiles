{
  imports = [
    ./mihomo
    ./mullvad
  ];
  services = {
    mihomo.enable = true;
  };
}
