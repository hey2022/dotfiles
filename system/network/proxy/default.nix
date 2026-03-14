{
  imports = [
    ./clash-verge.nix
    ./mihomo
    ./mullvad.nix
    ./v2raya.nix
  ];
  services.mihomo.enable = true;
  programs.clash-verge.enable = true;
}
