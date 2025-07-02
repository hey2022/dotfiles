{
  inputs,
  config,
  pkgs,
  ...
}:
let
  profile = "default";
  addons = import ../firefox/addons { inherit pkgs; };
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
    };
    profiles.${profile} = {
      isDefault = true;
      extraConfig = ''
        ${builtins.readFile "${inputs.betterfox}/zen/user.js"}
      '';
      userChrome = config.lib.hm.mkFlakeSymlink ./userChrome.css;
      userContent = config.lib.hm.mkFlakeSymlink ./userContent.css;
      settings = {
        "browser.tabs.allow_transparent_browser" = true;
        "extensions.autoDisableScopes" = 0;
        "nebula-tab-loading-animation" = 0;
      };
      extensions = {
        force = true;
        packages =
          with pkgs.nur.repos.rycee.firefox-addons;
          [
            aw-watcher-web
            keepassxc-browser
            languagetool
            libredirect
            redirector
            refined-github
            sponsorblock
            stylus
            tridactyl
            ublock-origin
            zotero-connector
          ]
          ++ (with addons; [
            bonjourr
            zen-internet
          ]);
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
    ".zen/${profile}/chrome/Nebula" = {
      source = "${inputs.zen-nebula}/Nebula";
      recursive = true;
    };
  };
}
