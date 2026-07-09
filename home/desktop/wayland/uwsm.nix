{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.uwsm;
in
{
  options = {
    programs.uwsm.enable = lib.mkEnableOption "uwsm";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.runapp ];
    xdg.configFile."uwsm/env".text = lib.concatLines (
      lib.mapAttrsToList (name: value: "export ${name}=${toString value}") config.home.sessionVariables
    );
  };
}
