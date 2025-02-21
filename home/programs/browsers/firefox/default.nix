{
  inputs,
  pkgs,
  ...
}: let
  profile = "default";
in {
  programs.firefox = {
    enable = true;
    languagePacks = ["en-GB" "zh-CN"];
    profiles.${profile} = {
      isDefault = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "extensions.autoDisableScopes" = 0;
      };
      extraConfig = builtins.readFile (builtins.fetchurl {
        url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js";
        sha256 = "1fr0ia7zjszy31sdp05h746b88761wswrwr61zw7hvn1a8dkvhaw";
      });
      userChrome = builtins.readFile ./userChrome.css;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        keepassxc-browser
        sidebery
      ];
    };
  };
  home.file = {
    ".mozilla/firefox/${profile}/chrome" = {
      source = inputs.firefox-csshacks;
      recursive = true;
    };
  };
}
