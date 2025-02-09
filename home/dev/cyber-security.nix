{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [rustscan];
  programs.firefox = lib.mkIf config.programs.firefox.enable {
    profiles.default = {
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        foxyproxy-standard
      ];
    };
  };
}
