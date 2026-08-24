{ pkgs, ... }:
{
  home.packages = with pkgs; [
    element-desktop
    slack
    vesktop
    wechat
  ];
}
