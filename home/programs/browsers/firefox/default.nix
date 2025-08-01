{
  inputs,
  pkgs,
  ...
}:
let
  profile = "default";
in
{
  imports = [ ./extensions ];
  programs.firefox = {
    languagePacks = [
      "en-GB"
      "zh-CN"
    ];
    nativeMessagingHosts = with pkgs; [
      tridactyl-native
    ];
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
          aw-watcher-web
          firefox-color
          keepassxc-browser
          languagetool
          libredirect
          redirector
          refined-github
          sidebery
          sponsorblock
          stylus
          tridactyl
          ublock-origin
          zotero-connector
        ];
      };
      search = {
        force = true;
        default = "Unduck";
        privateDefault = "Unduck";
        engines = {
          Unduck = {
            urls = [ { template = "https://s.dunkirk.sh?q={searchTerms}"; } ];
            definedAliases = [ "@!" ];
          };
        };
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
    profileNames = [ profile ];
    colorTheme.enable = true;
  };
}
