{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.profiles.gaming.enable {
    home.packages = with pkgs; [
      goverlay
      supertuxkart
    ];
  };
}
