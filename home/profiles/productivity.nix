{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.profiles.productivity;
in
{
  options = {
    profiles.productivity = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Weather to enable productivity profile";
      };
      images.enable = lib.mkEnableOption "Photo editing and management software";
    };
  };
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs = {
        obs-studio.enable = true;
        pandoc.enable = true;
        sioyek.enable = true;
        zathura.enable = false;
      };
      home.packages = with pkgs; [
        quarto
      ];
    })
    (lib.mkIf (cfg.enable && cfg.images.enable) {
      home.packages = with pkgs; [
        darktable
        digikam
        gimp
      ];
    })
  ];
}
