{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./font-awesome.nix
    ./local-fonts.nix
  ];
  home.packages = with pkgs; [
    inter
    lxgw-wenkai
  ];
}
