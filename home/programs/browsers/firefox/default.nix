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
      extraConfig = "${inputs.betterfox}/main/user.js";
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
