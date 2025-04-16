{pkgs, ...}: {
  imports = [
    ./iosevka
    ./font-awesome.nix
  ];
  home.packages = with pkgs; [
    corefonts
    inter
    lxgw-wenkai
    nerd-fonts.symbols-only
  ];
  fonts.fontconfig.enable = true;
}
