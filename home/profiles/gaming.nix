{
  config,
  lib,
  ...
}:
let
  cfg = config.profiles.gaming;
in
{
  options.profiles.gaming = {
    enable = lib.mkEnableOption "Gaming support";
  };
  config = lib.mkIf cfg.enable {
    programs.mangohud.enable = true;
  };
}
