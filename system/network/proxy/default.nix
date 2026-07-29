{
  imports = [
    ./clash-verge.nix
    ./mihomo
    ./mullvad
    ./v2raya.nix
  ];
  services = {
    mihomo.enable = true;
  };
}
