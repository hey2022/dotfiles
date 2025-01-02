{pkgs, ...}: let
  arcwtf = pkgs.fetchFromGitHub {
    owner = "KiKaraage";
    repo = "ArcWTF";
    rev = "d6e39f4e4fde3c5243ae4c2f6cc155cda6d48828";
    hash = "sha256-n8FidqN9UWnhBRU5AlnfrMtq8XzRd19V/hmfmlHmcCg=";
  };
  profile = "default";
in {
  programs.firefox = {
    enable = true;
    languagePacks = ["en-GB" "zh-CN"];
    profiles.${profile} = {
      isDefault = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "uc.tweak.popup-search" = true;
        "uc.tweak.hide-sidebar-header" = true;
        "extensions.autoDisableScopes" = 0;
      };
      extraConfig = builtins.readFile (builtins.fetchurl {
        url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js";
        sha256 = "1fr0ia7zjszy31sdp05h746b88761wswrwr61zw7hvn1a8dkvhaw";
      });
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        tridactyl
        keepassxc-browser
        sidebery
        userchrome-toggle
      ];
    };
  };
  home.file = {
    ".mozilla/firefox/${profile}/chrome" = {
      source = arcwtf;
      recursive = true;
    };
  };
}
