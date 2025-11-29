{ pkgs, ... }:
{
  imports = [
    ./iosevka
    ./font-awesome.nix
  ];
  home.packages = with pkgs; [
    corefonts
    eb-garamond
    inter-nerdfont
    lxgw-wenkai
    nerd-fonts.symbols-only
  ];
  fonts.fontconfig.enable = true;
}
