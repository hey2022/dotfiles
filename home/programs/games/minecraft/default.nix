{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [ ./fjord.nix ];
  config = lib.mkIf config.profiles.gaming.enable {
    home.packages = with pkgs; [
      cubiomes-viewer
    ];
  };
}
