{ pkgs, ... }:

{
  home.packages = with pkgs; [
    desktop-file-utils
    localsend
    moonlight-qt
    ripdrag
  ];
}
