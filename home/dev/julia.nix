{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.profiles.dev.julia;
in
{
  options.profiles.dev.julia.enable = lib.mkEnableOption "julia dev profile";
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ julia ];
  };
}
