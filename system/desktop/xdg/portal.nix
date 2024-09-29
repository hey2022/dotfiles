{
  config,
  lib,
  pkgs,
  ...
}:

{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };
}
