{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.profiles.dev.android;
in
{
  options.profiles.dev.android.enable = lib.mkEnableOption "android dev profile";
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      qtscrcpy
    ];
  };
}
