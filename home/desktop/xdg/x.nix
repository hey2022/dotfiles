{ config, ... }:
{
  xsession.initExtra = "xrdb -merge ${config.xresources.path}";
  xresources.properties = {
    "Xft.dpi" = 192;
  };
}
