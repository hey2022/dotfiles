{ pkgs, pkgs-local, ... }:
{
  home.packages = with pkgs; [
    corefonts
    eb-garamond
    font-awesome
    inter-nerdfont
    lxgw-wenkai
    nerd-fonts.symbols-only
    pkgs-local.IosevkaCustom
    pkgs-local.IosevkaProportionalCustom
    vista-fonts
  ];
  fonts.fontconfig.enable = true;
}
