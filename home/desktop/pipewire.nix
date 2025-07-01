{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pwvucontrol
    qpwgraph
  ];
  services.easyeffects.enable = true;
}
