{
  config,
  lib,
  pkgs-local,
  ...
}:
{
  config = lib.mkIf config.profiles.gaming.enable {
    home.packages = [
      pkgs-local.reshade-steam-proton
    ];
  };
}
