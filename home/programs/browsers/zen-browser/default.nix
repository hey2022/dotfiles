{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  profile = "default";
in
{
  imports = [
    inputs.zen-browser.homeModules.beta
    ../firefox/extensions
  ];
  programs.zen-browser = {
    enable = true;
    policies = {
      OfferToSaveLogins = false;
      Cookies = {
        Block = [
          "https://youtube.com"
        ];
      };
    };
    nativeMessagingHosts = with pkgs; [
      tridactyl-native
    ];
    languagePacks = [
      "en-GB"
      "zh-CN"
    ];
    profiles.${profile} = {
      isDefault = true;
      extraConfig = ''
        ${builtins.readFile "${inputs.betterfox}/zen/user.js"}
      '';
      userChrome = config.lib.hm.mkFlakeSymlink ./userChrome.css;
      userContent = config.lib.hm.mkFlakeSymlink ./userContent.css;
      settings = {
        "zen.urlbar.replace-newtab" = false;
        "browser.tabs.allow_transparent_browser" = true;
        "browser.tabs.closeWindowWithLastTab" = false;
        "extensions.autoDisableScopes" = 0;
        "nebula-tab-loading-animation" = 0;
      };
      extensions =
        let
          importExtension = path: import (../firefox/extensions + ("/" + path + ".nix")) { inherit pkgs; };
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
              tridactyl
              ublock-origin
              zotero-connector
            ];
          }
          (importExtension "redirector")
          (importExtension "bonjourr")
        ];
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
    ".zen/${profile}/chrome/Nebula" = {
      source = "${inputs.zen-nebula}/Nebula";
      recursive = true;
    };
  };
}
