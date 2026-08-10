{
  inputs,
  config,
  lib,
  pkgs,
  pkgs-local,
  ...
}:
let
  profile = "default";
in
{
  imports = [ ./_extensions ];
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    languagePacks = [
      "en-GB"
      "zh-CN"
    ];
    # https://mozilla.github.io/policy-templates
    policies = {
      Cookies = {
        Allow = [
          "https://app.element.io"
          "https://devdocs.io"
          "https://s.dunkirk.sh"
        ];
      };
    };
    nativeMessagingHosts = [ pkgs-local.keepassxc-snapshot ];
    profiles.${profile} = {
      isDefault = true;
      settings = {
        "browser.tabs.closeWindowWithLastTab" = false;
        "extensions.autoDisableScopes" = 0;
        "sidebar.expandOnHover" = false;
        "sidebar.revamp" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "ultima.sidebery.autohide" = false;
        "ultima.tabs.tabbar.disabled" = true;
        "user.theme.0.default" = false;
        "user.theme.catppuccin-mocha" = true;
      };
      preConfig = ''
        ${builtins.readFile "${inputs.betterfox}/user.js"}
        ${builtins.readFile "${inputs.firefox-ui-fix}/user.js"}
        ${builtins.readFile "${inputs.ff-ultima}/user.js"}
      '';
      userChrome = config.lib.hm.mkFlakeSymlink ./userChrome.css;
      userContent = config.lib.hm.mkFlakeSymlink ./userContent.css;
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
              grammarly
              keepassxc-browser
              libredirect
              refined-github
              sponsorblock
              translate-web-pages
              ublock-origin
              user-agent-string-switcher
              violentmonkey
              yomitan
              zotero-connector
            ];
          }
          (importExtension ./_extensions/redirector.nix)
          (importExtension ./_extensions/sidebery/default.nix)
        ];
      search = {
        force = true;
        default = "unduckified";
        privateDefault = "unduckified";
        engines = {
          SearXNG = {
            urls = [ { template = "http://localhost:8880/search?q={searchTerms}"; } ];
          };
          Brave = {
            urls = [ { template = "https://search.brave.com/search?q={searchTerms}"; } ];
          };
          unduckified = {
            urls = [ { template = "https://s.dunkirk.sh?q={searchTerms}"; } ];
          };
        };
      };
    };
  };
  home = {
    file = {
      "${config.programs.firefox.configPath}/${profile}/chrome/firefox-ui-fix" = {
        source = inputs.firefox-ui-fix;
      };
      "${config.programs.firefox.configPath}/${profile}/chrome/ff-ultima" = {
        source = inputs.ff-ultima;
      };
    };
  };
  # HACK: https://github.com/catppuccin/nix/issues/392 IFD
  catppuccin.firefox.enable = false;
  stylix.targets.firefox = {
    enable = true;
    profileNames = [ profile ];
  };
}
