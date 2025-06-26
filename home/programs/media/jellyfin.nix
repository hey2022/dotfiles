{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
    lib.mkIf config.profiles.entertainment.enable [
      jellyfin-media-player
    ];
}
