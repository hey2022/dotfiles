{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [mitmproxy];
  programs.firefox = lib.mkIf config.programs.firefox.enable {
    profiles.default = {
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        foxyproxy-standard
      ];
    };
  };
}
