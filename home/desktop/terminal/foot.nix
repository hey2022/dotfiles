{
  config,
  pkgs,
  ...
}: {
  programs.foot = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.foot;
    server.enable = true;
    settings = {
      main = {
        font = "IosevkaCustom:size=12";
      };
    };
  };
}
