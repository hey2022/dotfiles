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
    vista-fonts
  ];
  fonts.fontconfig.enable = true;
}
