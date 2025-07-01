{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.profiles.entertainment.anime.enable {
    home.packages = with pkgs; [
      ani-cli
      trackma
    ];
  };
}
