{ config, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.foot;
  };
}
