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
  imports = [ ./_extensions ];
  programs.firefox = {
    package = pkgs.firefox.override {
      extraPrefsFiles = [ "${inputs.ff-ultima}/userchromejs/firefox/config.js" ];
    };
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    languagePacks = [
      "en-GB"
      "zh-CN"
    ];
    # https://mozilla.github.io/policy-templates
    policies = {
      Cookies = {
        Allow = [
          "https://devdocs.io"
        ];
      };
      ExtensionSettings = {
        "userChromeCompanion@soulhotel.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/userchrome-companion";
          installation_mode = "force_installed";
        };
      };
    };
    nativeMessagingHosts = [ pkgs.keepassxc ];
    profiles.${profile} = {
      isDefault = true;
      settings = {
        "browser.tabs.closeWindowWithLastTab" = false;
        "extensions.autoDisableScopes" = 0;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      preConfig = ''
        ${builtins.readFile "${inputs.betterfox}/user.js"}
        ${builtins.readFile "${inputs.firefox-ui-fix}/user.js"}
      '';
      userChrome = config.lib.hm.mkFlakeSymlink ./userChrome.css;
      userContent = config.lib.hm.mkFlakeSymlink ./userContent.css;
      extensions =
        let
          importExtension = path: import path { inherit inputs pkgs; };
        in
        lib.mkMerge [
          {
            force = true;
            packages = with pkgs.nur.repos.rycee.firefox-addons; [
              darkreader
              keepassxc-browser
              libredirect
              refined-github
              sponsorblock
              translate-web-pages
              ublock-origin
              violentmonkey
              yomitan
              zotero-connector
            ];
          }
          (importExtension ./_extensions/sidebery/default.nix)
          (importExtension ./_extensions/violentmonkey/default.nix)
        ];
      search = {
        force = true;
        default = "kagi";
        privateDefault = "ddg";
        engines = {
          kagi = {
            urls = [ { template = "https://kagi.com/search?q={searchTerms}"; } ];
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
      "${config.programs.firefox.configPath}/${profile}/chrome/userchromejs" = {
        source = "${inputs.ff-ultima}/userchromejs";
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
