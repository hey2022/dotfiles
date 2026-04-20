{ config, lib, ... }:

let
  cfg = config.programs.espanso-config;
in
{
  options.programs.espanso-config = {
    enable = lib.mkEnableOption "Config for espanso";
    configDir = lib.mkOption {
      type = lib.types.path;
      description = ''
        Espanso config directory
      '';
    };
  };
  config = lib.mkIf cfg.enable {
    xdg.configFile."espanso".source = cfg.configDir;
  };
}
