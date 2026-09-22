{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.noctalia;
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  config = lib.mkIf cfg.enable {
    programs.noctalia = {
      package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
      systemd.enable = true;
    };
    xdg.configFile."noctalia".source = config.lib.hm.mkFlakeSymlink ./config;
  };
}
