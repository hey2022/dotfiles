{
  config,
  lib,
  ...
}: {
  options.profiles.gaming = {
    enable = lib.mkEnableOption "Gaming support";
  };
  config = lib.mkIf config.profiles.gaming.enable {
    programs.mangohud.enable = true;
  };
}
