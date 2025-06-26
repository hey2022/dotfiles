{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    profiles.education.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Weather to enable education profile";
    };
  };
  config = lib.mkIf config.profiles.education.enable {
    home.packages = with pkgs; [
      inputs.tls-xb.packages.${pkgs.system}.default
      teams-for-linux
      zotero
    ];
  };
}
