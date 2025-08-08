{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.profiles.dev.sqlite;
in
{
  options.profiles.dev.sqlite.enable = lib.mkEnableOption "sqlite dev profile";
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      sqlitebrowser
    ];
  };
}
