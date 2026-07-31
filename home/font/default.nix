{ pkgs, pkgs-local, ... }:
{
  imports = [
    ./font-awesome.nix
  ];
  home.packages = with pkgs; [
    corefonts
    eb-garamond
    inter-nerdfont
    lxgw-wenkai
    nerd-fonts.symbols-only
    pkgs-local.IosevkaCustom
    pkgs-local.IosevkaProportionalCustom
    vista-fonts
  ];
  fonts.fontconfig.enable = true;
}
