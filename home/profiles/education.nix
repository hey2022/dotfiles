{
  config,
  lib,
  pkgs,
  pkgs-local,
  ...
}:
{
  options = {
    profiles.education.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Weather to enable education profile";
    };
  };
  config = lib.mkIf config.profiles.education.enable {
    home.packages = with pkgs; [
      pkgs-local.ap-dl
      pkgs-local.apcap
      zotero
    ];
    nixpkgs.config.permittedInsecurePackages = [
      # zotero
      "firefox-esr-140-bin-unwrapped-140.17.0esr"
    ];
  };
}
