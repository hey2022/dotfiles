{pkgs, ...}: {
  imports = [
    ./iosevka
    ./font-awesome.nix
  ];
  home.packages = with pkgs; [
    nerd-fonts.symbols-only
    inter
    lxgw-wenkai
  ];
}
