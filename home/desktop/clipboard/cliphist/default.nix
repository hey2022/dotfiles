{
  config,
  lib,
  pkgs-local,
  ...
}:

{
  config = lib.mkIf config.services.cliphist.enable {
    home.packages = [ pkgs-local.cliprust ];
    services.cliphist = {
      package = pkgs-local.cliprust;
      extraOptions = [ ];
    };
    xdg.configFile."cliprust/config.toml".source = config.lib.hm.mkFlakeSymlink ./config.toml;
  };
}
