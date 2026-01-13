{
  config,
  lib,
  ...
}:
{
  options = {
    profiles.productivity.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Weather to enable productivity profile";
    };
  };
  config = lib.mkIf config.profiles.productivity.enable {
    programs = {
      obs-studio.enable = true;
      pandoc.enable = true;
      sioyek.enable = true;
      zathura.enable = false;
    };
  };
}
