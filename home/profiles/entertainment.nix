{
  config,
  lib,
  ...
}: let
  cfg = config.profiles.entertainment;
in {
  options.profiles.entertainment = {
    enable = lib.mkEnableOption "Entertainment profile";
    anime.enable = lib.mkEnableOption "Anime profile";
  };
  config = {
    profiles.entertainment.anime.enable = lib.mkDefault cfg.enable;
  };
}
