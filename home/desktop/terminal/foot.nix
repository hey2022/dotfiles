{
  config,
  pkgs,
  ...
}:
{
  programs.foot = {
    package = config.lib.nixGL.wrap pkgs.foot;
    server.enable = true;
    settings = {
      main = {
        font = "IosevkaCustom:size=12";
      };
    };
  };
}
