{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  profile = "default";
in
{
  imports = [ ./extensions ];
  programs.firefox = {
    enable = true;
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
        "ultima.sidebery.autohide" = false;
        "ultima.tabs.tabbar.disabled" = true;
        "sidebar.expandOnHover" = false;
        "user.theme.0.default" = false;
        "user.theme.catppuccin-mocha" = true;
      };
      preConfig = ''
        ${builtins.readFile "${inputs.betterfox}/user.js"}
        ${builtins.readFile "${inputs.firefox-ui-fix}/user.js"}
        ${builtins.readFile "${inputs.ff-ultima}/user.js"}
      '';
      userChrome = ./userChrome.css;
      userContent = ./userContent.css;
      extensions =
        let
          importExtension = path: import path { inherit pkgs; };
        in
        lib.mkMerge [
          {
            force = true;
            packages = with pkgs.nur.repos.rycee.firefox-addons; [
              aw-watcher-web
              darkreader
              keepassxc-browser
              languagetool
              libredirect
              refined-github
              sponsorblock
              translate-web-pages
              tridactyl
              ublock-origin
              violentmonkey
              yomitan
              zotero-connector
            ];
          }
          (importExtension ./extensions/redirector.nix)
          (importExtension ./extensions/sidebery/default.nix)
        ];
      search = {
        force = true;
        default = "Brave";
        privateDefault = "Brave";
        engines = {
          SearXNG = {
            urls = [ { template = "http://localhost:8880/search?q={searchTerms}"; } ];
          };
          Brave = {
            urls = [ { template = "https://search.brave.com/search?q={searchTerms}"; } ];
          };
        };
      };
    };
  };
  home = {
    file = {
      ".mozilla/firefox/${profile}/chrome/firefox-ui-fix" = {
        source = inputs.firefox-ui-fix;
        recursive = true;
      };
      ".mozilla/firefox/${profile}/chrome/ff-ultima" = {
        source = inputs.ff-ultima;
        recursive = true;
      };
    };
  };
}
