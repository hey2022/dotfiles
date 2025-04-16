{
  inputs,
  pkgs,
  ...
}: let
  profile = "default";
in {
  imports = [./extensions];
  programs.firefox = {
    enable = true;
    languagePacks = ["en-GB" "zh-CN"];
    profiles.${profile} = {
      isDefault = true;
      settings = {
        "browser.tabs.closeWindowWithLastTab" = false;
        "extensions.autoDisableScopes" = 0;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      extraConfig = ''
        ${builtins.readFile "${inputs.betterfox}/user.js"}
        ${builtins.readFile "${inputs.firefox-ui-fix}/user.js"}
      '';
      userChrome = ./userChrome.css;
      userContent = ./userContent.css;
      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          keepassxc-browser
          sidebery
          stylus
          tridactyl
          firefox-color
        ];
      };
    };
  };
  home.file = {
    ".mozilla/firefox/${profile}/chrome/firefox-ui-fix" = {
      source = inputs.firefox-ui-fix;
      recursive = true;
    };
  };
  stylix.targets.firefox = {
    profileNames = [profile];
    colorTheme.enable = true;
  };
}
