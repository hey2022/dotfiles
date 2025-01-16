{pkgs, ...}: {
  imports = [
    ./iosevka
    ./font-awesome.nix
  ];
  home.packages = with pkgs; [
    inter
    lxgw-wenkai
  ];
}
