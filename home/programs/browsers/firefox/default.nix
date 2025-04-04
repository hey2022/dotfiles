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
      extraConfig = ''
        ${builtins.readFile "${inputs.betterfox}/user.js"}
        ${builtins.readFile "${inputs.firefox-ui-fix}/user.js"}
      '';
      userChrome = builtins.readFile ./userChrome.css;
      userContent = builtins.readFile ./userContent.css;
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
        settings = {
          "tridactyl.vim@cmcaine.co.uk".settings = {
            userconfig = {
              smoothscroll = "true";
            };
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
    profileNames = [profile];
    colorTheme.enable = true;
  };
}
