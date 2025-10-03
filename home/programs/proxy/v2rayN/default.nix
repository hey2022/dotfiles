{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    v2rayn
  ];
  xdg.dataFile."v2rayN/bin/sing_box/sing-box".source = lib.getExe pkgs.sing-box;
}
