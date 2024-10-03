{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.foot = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.foot;
  };
  xdg.configFile."foot/foot.ini".source = ./foot.ini;
}
