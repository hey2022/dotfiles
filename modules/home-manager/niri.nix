{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.niri;
in
{
  options.programs.niri = {
    enable = lib.mkEnableOption "Niri, A scrollable-tiling Wayland compositor";
    package = lib.mkPackageOption pkgs "niri" { };
    configFile = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = ''
        Niri kdl config file path.
      '';
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];
    xdg.configFile."niri/config.kdl".source = cfg.configFile;
  };
}
