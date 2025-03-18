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
        "browser.tabs.closeWindowWithLastTab" = false;
      };
      extraConfig = "${inputs.betterfox}/main/user.js";
      userChrome = builtins.readFile ./userChrome.css;
      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          keepassxc-browser
          sidebery
          stylus
          tridactyl
        ];
      };
    };
  };
  home.file = {
    ".mozilla/firefox/${profile}/chrome" = {
      source = inputs.firefox-csshacks;
      recursive = true;
    };
  };
  stylix.targets.firefox = {
    profileNames = [profile];
    colorTheme.enable = true;
  };
}
