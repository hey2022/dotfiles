{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clash-verge-rev
  ];
  xdg.configFile."uwsm/env".text = ''
    export https_proxy=http://127.0.0.1:7897
    export http_proxy=http://127.0.0.1:7897
  '';

}
